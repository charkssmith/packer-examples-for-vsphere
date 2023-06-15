$ErrorActionPreference = "Stop"

$installer = "VMware Dynamic Environment Manager Enterprise 2303 10.9 x64.msi"
$licence = " VMware-DEM-10.9.0-GA.lic"
$listConfig = "/i ""F:\$installer"" /qn /norestart ADDLOCAL=FlexEngine COMPENVCONFIGFILEPATH=\\synology.thesmiths.pw\DEMConfig\general"

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