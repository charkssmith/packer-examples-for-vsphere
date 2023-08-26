$ErrorActionPreference = "Stop"
$software = "officesetup.*"

### Set variables for install ###
$installer = Get-Item $env:TEMP\$software | Select-Object -ExpandProperty Name
$listconfig = "/configure TheSmiths_Configuration.xml"

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