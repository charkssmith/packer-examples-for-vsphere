$ErrorActionPreference = "Stop"

$osotfiles = @('VMwareHorizonOSOptimizationTool.exe', 'Windows10-11-OneDrive.json')
$utilities = @('sdelete64.exe', 'LGPO.exe')
$exe = $osotfiles[0]
$json = $osotfiles[1]

$arg = "-o -v -applyoptimization $json -f 0 1 3 4 5 6 8 9 10"


  # Get the OSOT files
  ForEach ($file in $osotfiles){
    Copy-Item F:\$file $env:TEMP\$file
    Unblock-File $env:TEMP\$file
  }

  ForEach ($utility in $utilities){
    Copy-Item F:\$utility C:\Windows\System32\$utility
    Unblock-File C:\Windows\System32\$utility -Confirm:$false
  }

  # Change to temp folder
  Set-Location $env:TEMP

  # Run OSOT
  Try
  {
    Start-Process $exe -ArgumentList $arg -Passthru -Wait -ErrorAction stop
  }
  Catch
  {
    Write-Error "Failed to run OSOT"
    Write-Error $_.Exception
    Exit -1
  }
