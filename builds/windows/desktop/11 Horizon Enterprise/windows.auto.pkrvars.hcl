/*
    DESCRIPTION:
    Microsoft Windows 11 Professional variables used by the Packer Plugin for VMware vSphere (vsphere-iso).
*/

// Installation Operating System Metadata
vm_inst_os_language = "en-US"
vm_inst_os_keyboard = "en-US"
vm_inst_os_image    = "Windows 11 Enterprise"
vm_inst_os_kms_key  = "TNP2F-X9BP9-MFVGQ-GV36F-KBT44"

// Guest Operating System Metadata
vm_guest_os_language = "en-US"
vm_guest_os_keyboard = "en-US"
vm_guest_os_timezone = "UTC"
vm_guest_os_family   = "windows"
vm_guest_os_name     = "desktop"
vm_guest_os_version  = "11"
vm_guest_os_edition  = "Enterprise"

// Virtual Machine Guest Operating System Setting
vm_guest_os_type = "windows9_64Guest"

// Virtual Machine Hardware Settings
vm_firmware              = "efi-secure"
vm_cdrom_type            = "sata"
vm_cpu_count             = 2
vm_cpu_cores             = 1
vm_cpu_hot_add           = false
vm_mem_size              = 4096
vm_mem_hot_add           = false
vm_vtpm                  = true
vm_disk_size             = 40960
vm_disk_controller_type  = ["pvscsi"]
vm_disk_thin_provisioned = true
vm_network_card          = "vmxnet3"
vm_video_mem_size        = 131072
vm_video_displays        = 4

// Removable Media Settings
iso_url            = null
iso_path           = "iso/windows/desktop"
iso_file           = "en-us_windows_11_business_editions_version_22h2_updated_sep_2023_x64_dvd_f2ea646d.iso"
iso_checksum_type  = "sha256"
iso_checksum_value = "AE924371F0725C9BC3C26D3AD50478955FECBF46C771E32773209F1222AAEC7E"

// Boot Settings
vm_boot_order       = "disk,cdrom"
vm_boot_wait        = "3s"
vm_boot_command     = ["<spacebar><spacebar>"]
vm_shutdown_command = "shutdown /s /t 10 /f /d p:4:1 /c \"Shutdown by Packer\""

// Communicator Settings
communicator_port    = 5985
communicator_timeout = "12h"

// Provisioner Settings
scripts = ["scripts/windows/windows-prepare.ps1"]

inline = [
  "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))",
  "choco feature enable -n allowGlobalConfirmation",
// Install PowerCLI
  "choco install vmware-powercli-psmodule",
// Install FSLogix
  "choco install fslogix",
// Install OneDrive
  "choco install onedrive",
// Install Microsoft Teams
  "choco install microsoft-teams.install",
// Install FireFox
  "choco install firefox",
// Install Google Chrome
  "choco install googlechrome",
// Install Adobe Reader
  "choco install adobereader",
// Install BGInfo
  "choco install bginfo",
  "Get-EventLog -LogName * | ForEach { Clear-EventLog -LogName $_.Log }"
]