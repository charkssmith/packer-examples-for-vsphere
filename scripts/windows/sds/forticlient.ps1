$ErrorActionPreference = "Stop"

$installer = "FortiClientVPNSetup_7.4.2.1737_x64.exe"

  # Change to temp folder
  Set-Location $env:TEMP

  # Install o365
  Try
  {
    Start-Process $env:TEMP\$installer -ArgumentList -PassThru -Wait -ErrorAction Stop
  }
  Catch
  {
    Write-Error "Failed to install o365"
    Write-Error $_.Exception
    Exit -1 
  }