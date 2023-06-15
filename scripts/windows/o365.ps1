$ErrorActionPreference = "Stop"

$installer = "setup.exe"
$files = ('setup.exe', 'TheSmiths_Configuration.xml')
$listconfig = "/configure TheSmiths_Configuration.xml"

  # copy files to temp folder
  ForEach ($file in $files){
  Copy-Item F:\$file $env:TEMP\$file
  Unblock-File $env:TEMP\$file -Confirm:$false
  }

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