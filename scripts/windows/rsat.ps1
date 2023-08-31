$ErrorActionPreference = "Stop"

Get-WindowsCapability -Name RSAT* -Online | Add-WindowsCapability -Online