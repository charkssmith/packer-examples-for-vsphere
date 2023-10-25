$ErrorActionPreference = "Stop"

$osotfiles = @('VMwareHorizonOSOptimizationTool.exe', 'Windows10-11-OneDrive.json')
$utilities = @('sdelete64.exe', 'LGPO.exe')
$exe = $osotfiles[0]
$json = $osotfiles[1]

$arg = "-o -v -applyoptimization $env:TEMP\$json"

  ForEach ($utility in $utilities){
    Copy-Item $env:TEMP\$utility C:\Windows\System32\$utility
    Unblock-File C:\Windows\System32\$utility -Confirm:$false
  }

  # Run OSOT
  Try
  {
    Start-Process $env:TEMP\$exe -ArgumentList  $arg -Passthru -Wait -ErrorAction stop
  }
  Catch
  {
    Write-Error "Failed to run OSOT"
    Write-Error $_.Exception
    Exit -1
  }
