$ErrorActionPreference = "Stop"

$installer = "VMware-Horizon-Agent-x86_64-2306-8.10.0-22012512.exe"
$listConfig = "/s /v ""/qn REBOOT=ReallySuppress ADDLOCAL=Core,USB,NGVC,RTAV,ClientDriveRedirection,V4V,VmwVaudio,TSMMR,RDP,BlastUDP,SdoSensor,PerfTracker,HelpDesk,PrintRedir"""
# Core = Core
# USB = USB Redirection
# NGVC = Instant Clone Agent
# RTAV = Real-Time Audio-Video
# ClientDriveRedirection = ClientDriveRedirection
# SerialPortRedirection = Serial Port Redirection
# ScannerRedirection = Scanner Redirection
# GEOREDIR = Geolocation Redirection
# V4V = Horizon Monitoring Service Agent
# SmartCard = PCoIP Smartcard This feature is not installed by default in an interactive installation.
# VmwVaudio = VMware Audio (virtual audio driver)
# VmVideo = VMware Video (virtual video driver)
# VmwVidd = VMware Indirect Display Driver
# TSMMR = Windows Media Multimedia Redirection (MMR)
# RDP = Enables RDP in the registry if you use the RDP_CHOICE=1 property on the command line or select RDP as the default display protocol when you create or edit a desktop pool. This feature is hidden during interactive installations.
# VMWMediaProviderProxy = VMware Virtualization Pack for Skype for Business
# RDSH3D = 3D rendering on RDS hosts
# BlastUDP = UDP Transport support for Blast
# SdoSensor = SDO Sensor Redirection
# PerfTracker = Horizon Performance Tracker
# HelpDesk = Horizon Help Desk Tool
# PrintRedir = VMware Integrated Printing
# UnityTouch = Unity Touch
# PSG = This feature sets a registry entry that tells Connection Server whether Horizon Agent is using IPv4 or IPv6.
# Verify connectivity

  # Install Horizon Agent
  Try {
    Start-Process I:\Packer\$installer -ArgumentList $listConfig -PassThru -Wait -ErrorAction Stop
    Set-Service -Name vmlm -StartupType Automatic
  } Catch {
    Write-Error "Failed to install the Horizon Agent"
    Write-Error $_.Exception
    Exit -1
  }

