$ErrorActionPreference = "Stop"

$osotfiles = @('VMwareHorizonOSOptimizationTool.exe', 'Windows10-11-SDS.json')
$utilities = @('sdelete64.exe', 'LGPO.exe')
$exe = $osotfiles[0]
$json = $osotfiles[1]

$arg = "-o -v -applyoptimization $env:TEMP\$json  -f 0 1 3 4 5 6 8 9 10 -r c:\reports\"

    New-Item -ItemType Directory -Path C:\Windows\VMwareOSOT
    Copy-Item $env:TEMP\$exe C:\Windows\VMwareOSOT\$exe
    Unblock-File C:\Windows\VMwareOSOT\$exe -Confirm:$false

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
