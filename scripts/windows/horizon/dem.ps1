$ErrorActionPreference = "Stop"

$installer = "VMware Dynamic Environment Manager Enterprise 2212 10.8 x64.msi"
$licence = "VMware-DEM-10.7.0-GA.lic"
$listConfig = "/i ""F:\$installer"" /qn /norestart ADDLOCAL=FlexEngine LICENSEFILE=F:\VMware-DEM-10.7.0-GA.lic"

  # Install DEM Agent
  Try
  {
    Start-Process msiexec.exe -ArgumentList $listConfig -PassThru -Wait
  }
  Catch
  {
    Write-Error "Failed to install the DEM Agent"
    Write-Error $_.Exception
    Exit -1 
  }

