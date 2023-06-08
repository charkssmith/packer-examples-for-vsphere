$ErrorActionPreference = "Stop"

$installer = "FSLogixAppsSetup.exe"
$listConfig = "/install /quiet /norestart"

  # Install FSLogix
  Try 
  {
    Start-Process F:\$installer -ArgumentList $listConfig -PassThru -Wait
  }
  Catch
  {
    Write-Error "Failed to install FSLogix"
    Write-Error $_.Exception
    Exit -1 
  }
