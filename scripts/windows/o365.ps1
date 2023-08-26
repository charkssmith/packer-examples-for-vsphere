$ErrorActionPreference = "Stop"

$installer = "setup.exe"
$listconfig = "/configure TheSmiths_Configuration.xml"

  # Change to temp folder
  Set-Location $env:TEMP

  # Install o365
  Try
  {
    Start-Process $installer -ArgumentList $listConfig -PassThru -Wait -ErrorAction Stop
  }
  Catch
  {
    Write-Error "Failed to install o365"
    Write-Error $_.Exception
    Exit -1 
  }