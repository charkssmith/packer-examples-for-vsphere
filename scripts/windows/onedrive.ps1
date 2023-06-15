$ErrorActionPreference = "Stop"

$installer = "OneDriveSetup.exe"
$listConfig = "/allusers"

  Try {
    Start-Process F:\$installer -ArgumentList $listConfig -PassThru -Wait -ErrorAction Stop
  } Catch {
    Write-Error "Failed to install OneDrive"
    Write-Error $_.Exception
    Exit -1
  }

