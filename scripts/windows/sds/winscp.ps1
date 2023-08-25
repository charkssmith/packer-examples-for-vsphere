$ErrorActionPreference = "Stop"
$software = "WinSCP*"

### Set variables for install ###
$installer = Get-Item $env:TEMP\$software | Select-Object -ExpandProperty Name
$listConfig = "/i ""$env:TEMP\$installer"" /VERYSILENT"

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
