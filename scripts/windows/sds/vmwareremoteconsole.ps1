$ErrorActionPreference = "Stop"
$software = "VMware-VMRC*"

### Set variables for install ###
$installer = Get-Item $env:TEMP\$software | Select-Object -ExpandProperty Name
$listConfig = "/i ""$env:TEMP\$installer"" /s /v ""/qn EULAS_AGREED=1 AUTOSOFTWAREUPDATE=0 "

Try 
{
  Start-Process $env:TEMP\$installer -ArgumentList $listConfig -PassThru -Wait -ErrorAction Stop
}
Catch
{
  Write-Error "Failed to install $installer"
  Write-Error $_.Exception
  Exit -1 
}
