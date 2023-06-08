$ErrorActionPreference = "Stop"

$installer = "VMware DEM Application Profiler 2206 10.6 x64.msi"
$listConfig = "/i ""F:\$installer"" /qn /norestart"

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
