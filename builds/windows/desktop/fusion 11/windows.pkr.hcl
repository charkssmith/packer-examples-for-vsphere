/*
    DESCRIPTION:
    Microsoft Windows 11 Professional template using the Packer Builder for VMware vSphere (vsphere-iso).
*/

//  BLOCK: packer
//  The Packer configuration.

packer {
  required_version = ">= 1.8.6"
  required_plugins {
    git = {
      version = ">= 0.3.3"
      source  = "github.com/ethanmdavidson/git"
    }
    vsphere = {
      version = ">= v1.1.1"
      source  = "github.com/hashicorp/vsphere"
    }
    windows-update = {
      version = ">= 0.14.1"
      source  = "github.com/rgl/windows-update"
    }
  }
}

//  BLOCK: data
//  Defines the data sources.

data "git-repository" "cwd" {}

//  BLOCK: locals
//  Defines the local variables.

locals {
  build_by           = "Built by: HashiCorp Packer ${packer.version}"
  build_date         = formatdate("YYYY-MM-DD", timestamp())
  build_version      = data.git-repository.cwd.head
  build_description  = "Version: ${local.build_version}\nBuilt on: ${local.build_date}\n${local.build_by}"
  iso_paths          = "/Users/charliesmith/OneDrive - Sequel Data Systems/Software/iso/windows/desktop/22631.2861.231204-0538.23H2_NI_RELEASE_SVC_REFRESH_CLIENTCONSUMER_RET_A64FRE_en-us.iso"
  iso_checksum       = "c3c37ebab3d61cedc442b9cab589881094b91e78008acb0a75c156f305b2e8bb"
  manifest_date      = formatdate("YYYY-MM-DD hh:mm:ss", timestamp())
  manifest_path      = "${path.cwd}/manifests/"
  manifest_output    = "${local.manifest_path}${local.manifest_date}.json"
  ovf_export_path    = "${path.cwd}/artifacts/${local.vm_name}"
  vm_name            = "test"
}

//  BLOCK: source
//  Defines the builder configuration blocks.

source "vsphere-iso" "windows-desktop-11" {


    // VM
  vm_name                 =   "GI-W10-001" 
  operating_system_vm     =   "windows9-64"
  vm_firmware             =   "bios"
  vm_cdrom_type           =   "ide"
  vm_cpus                 =   "2"
  vm_cores                =   "1"
  vm_memory               =   "2048"
  vm_disk_controller_type =   "nvme"
  vm_disk_size            =   "32768"
  vm_network_adapter_type =   "e1000e"
  // Use the NAT Network
  vm_network              =   "VMnet8"
  vm_hardwareversion      =   "19"
  // Removable Media Settings
  iso_paths    = local.iso_paths
  iso_checksum = local.iso_checksum
 

}

//  BLOCK: build
//  Defines the builders to run, provisioners, and post-processors.

build {
  sources = [
    "source.vsphere-iso.windows-desktop-11",
  ]

  provisioner "powershell" {
    environment_vars = [
      "BUILD_USERNAME=${var.build_username}",
      "SOFTWARE_DATASTORE=${var.common_iso_datastore}"
    ]
    elevated_user     = var.build_username
    elevated_password = var.build_password
    scripts           = formatlist("${path.cwd}/%s", var.scripts)
  }

  provisioner "powershell" {
    elevated_user     = var.build_username
    elevated_password = var.build_password
    inline            = var.inline
  }

  provisioner "windows-update" {
    pause_before    = "30s"
    search_criteria = "IsInstalled=0"
    filters = [
      "exclude:$_.Title -like '*VMware*'",
      "exclude:$_.Title -like '*Preview*'",
      "exclude:$_.Title -like '*Defender*'",
      "exclude:$_.InstallationBehavior.CanRequestUserInput",
      "include:$true"
    ]
    restart_timeout = "120m"
  }



}
