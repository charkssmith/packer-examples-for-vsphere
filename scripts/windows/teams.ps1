$ErrorActionPreference = "Stop"

$installer = "Teams_windows_x64.msi"
$listConfig = "/i ""F:\$installer"" ALLUSERS=1 ALLUSER=1"

  Try 
  {
    Start-Process msiexec.exe -ArgumentList $listConfig -PassThru -Wait
  }
  Catch
  {
    Write-Error "Failed to install the Teams"
    Write-Error $_.Exception
    Exit -1 
  }
