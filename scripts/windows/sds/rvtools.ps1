$ErrorActionPreference = "Stop"
$software = "RVTools*"

### Set variables for install ###
$installer = Get-Item $env:TEMP\$software | Select-Object -ExpandProperty Name
$listConfig = "/i ""$env:TEMP\$installer"" /passive"

Try 
{
  Start-Process msiexec.exe -ArgumentList $listConfig -PassThru -Wait
}
Catch
{
  Write-Error "Failed to install RVTools"
  Write-Error $_.Exception
  Exit -1 
}