$ErrorActionPreference = "Stop"
$software = "OneDriveSetup.*"

### Set variables for install ###
$installer = Get-Item $env:TEMP\$software | Select-Object -ExpandProperty Name
$listConfig = "/allusers"

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


