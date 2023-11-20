$ErrorActionPreference = "Stop"
$software = "VMware Dynamic Environment Manager*"

### Set variables for install ###
$installer = Get-Item $env:TEMP\$software | Select-Object -ExpandProperty Name
$listConfig = "/i ""$env:TEMP\$installer""  /qn /norestart COMPENVCONFIGFILEPATH=\\city.col\public\DEM Config\General"

Try 
{
  Start-Process msiexec.exe -ArgumentList $listConfig -PassThru -Wait
}
Catch
{
  Write-Error "Failed to install $installer"
  Write-Error $_.Exception
  Exit -1 
}