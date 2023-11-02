provider "vsphere" {
  vsphere_server       = var.vsphere_server
  user                 = var.vsphere_username
  password             = var.vsphere_password
  allow_unverified_ssl = var.vsphere_insecure
}

data "vsphere_datacenter" "datacenter" {
  name = var.vsphere_datacenter
}

data "vsphere_network" "network" {
  name          = var.vsphere_network
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_compute_cluster" "cluster" {
  name          = var.vsphere_cluster
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_resource_pool" "pool" {
  name          = format("%s%s", data.vsphere_compute_cluster.cluster.name, "/Resources")
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_datastore" "datastore" {
  name          = var.vsphere_datastore
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_virtual_machine" "template" {
  name          = var.vsphere_template
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

locals {
  csv_data   = file("${path.module}/test.csv")
  vminfo     = csvdecode(local.csv_data)
  csinfo_map = { for cs in local.vminfo : cs.ConnectionServer => cs } #covert CSV data to map
}

resource "vsphere_virtual_machine" "vm" {
  for_each                = local.csinfo_map
  name                    = each.value.ConnectionServer
  folder                  = var.vsphere_folder
  num_cpus                = each.value.CPU
  memory                  = each.value.Memory
  firmware                = var.vm_firmware
  efi_secure_boot_enabled = var.vm_efi_secure_boot_enabled
  guest_id                = data.vsphere_virtual_machine.template.guest_id
  datastore_id            = data.vsphere_datastore.datastore.id
  resource_pool_id        = data.vsphere_resource_pool.pool.id
  network_interface {
    network_id = data.vsphere_network.network.id
  }
  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.template.disks[0].size
    eagerly_scrub    = data.vsphere_virtual_machine.template.disks[0].eagerly_scrub
    thin_provisioned = data.vsphere_virtual_machine.template.disks[0].thin_provisioned
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    customize {
      windows_options {
        computer_name         = each.value.ConnectionServer
        join_domain           = var.domain
        domain_admin_user     = var.domain_admin_username
        domain_admin_password = var.domain_admin_password
        admin_password        = var.vm_admin_password
      }
      network_interface {
        ipv4_address = each.value.IPAddress
        ipv4_netmask = var.vm_ipv4_netmask
      }

      ipv4_gateway    = var.vm_ipv4_gateway
      dns_suffix_list = var.vm_dns_suffix_list
      dns_server_list = var.vm_dns_server_list
    }
  }

  lifecycle {
    ignore_changes = [
      clone[0].template_uuid,
    ]
  }
  connection {
    host     = each.value.IPAddress
    type     = "winrm"
    port     = 5985
    https    = false
    timeout  = "2m"
    user     = var.domain_admin_username
    password = var.domain_admin_password
  }

  provisioner "file" {
    source      = "copyinstaller.ps1"
    destination = "C:\\"
  }

}


