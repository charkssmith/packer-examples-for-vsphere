$ErrorActionPreference = "Stop"
$software = "AcroRdrDC*"

### Set variables for install ###
$installer = Get-Item $env:TEMP\$software | Select-Object -ExpandProperty Name
$listConfig = "/msi EULA_ACCEPT=YES /qn"

Set-Location $env:TEMP

Try
{
  Start-Process $installer -ArgumentList $listConfig -PassThru -Wait -ErrorAction Stop
}
Catch
{
  Write-Error "Failed to install $installer"
  Write-Error $_.Exception
  Exit -1
}