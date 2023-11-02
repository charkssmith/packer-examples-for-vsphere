/*
    DESCRIPTION:
    Microsoft Windows Server 2022 template using the Packer Builder for VMware vSphere (vsphere-iso).
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
  build_by                   = "Built by: HashiCorp Packer ${packer.version}"
  build_date                 = formatdate("YYYY-MM-DD hh:mm ZZZ", timestamp())
  build_version              = data.git-repository.cwd.head
  build_description          = "Version: ${local.build_version}\nBuilt on: ${local.build_date}\n${local.build_by}"
  iso_paths                  = ["[${var.common_iso_datastore}] ${var.iso_path}/${var.iso_file}", "[] /vmimages/tools-isoimages/${var.vm_guest_os_family}.iso"]
  iso_checksum               = "${var.iso_checksum_type}:${var.iso_checksum_value}"
  manifest_date              = formatdate("YYYY-MM-DD hh:mm:ss", timestamp())
  manifest_path              = "${path.cwd}/manifests/"
  manifest_output            = "${local.manifest_path}${local.manifest_date}.json"
  ovf_export_path            = "${path.cwd}/artifacts/"
  vm_name_datacenter_core    = "${var.vm_guest_os_family}-${var.vm_guest_os_name}-${var.vm_guest_os_version}-${var.vm_guest_os_edition_datacenter}-${var.vm_guest_os_experience_core}-${local.build_version}"
  vm_name_datacenter_desktop = "${var.vm_guest_os_family}-${var.vm_guest_os_name}-${var.vm_guest_os_version}-${var.vm_guest_os_edition_datacenter}-${var.vm_guest_os_experience_desktop}-${local.build_version}"
  vm_name_standard_core      = "${var.vm_guest_os_family}-${var.vm_guest_os_name}-${var.vm_guest_os_version}-${var.vm_guest_os_edition_standard}-${var.vm_guest_os_experience_core}-${local.build_version}"
  vm_name_standard_desktop   = "${var.vm_guest_os_family}-${var.vm_guest_os_name}-${var.vm_guest_os_version}-${var.vm_guest_os_edition_standard}-${var.vm_guest_os_experience_desktop}-${local.build_version}"
  bucket_name                = replace("${var.vm_guest_os_family}-${var.vm_guest_os_name}-${var.vm_guest_os_version}", ".", "")
  bucket_description         = "${var.vm_guest_os_family} ${var.vm_guest_os_name} ${var.vm_guest_os_version}"
}

//  BLOCK: source
//  Defines the builder configuration blocks.

source "vsphere-clone" "vsphere" {

  // vCenter Server Endpoint Settings and Credentials
  vcenter_server      = var.vsphere_endpoint
  username            = var.vsphere_username
  password            = var.vsphere_password
  insecure_connection = var.vsphere_insecure_connection

  // vSphere Settings
  datacenter = var.vsphere_datacenter
}

//  BLOCK: build
//  Defines the builders to run, provisioners, and post-processors.

build {
  source "sources.vsphere-clone.vsphere"{
    cluster = "TheClover"

    network = "Servers"
    template = "windows-server-2022-standard-dexp-main"
    vm_name = "packer_test"
    ssh_username = "root"
 }
}