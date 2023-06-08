$ErrorActionPreference = "Stop"


$exe = "sdelete64.exe"
$arg = "-z c: /accepteula"

Set-Location $env:TEMP

# Run SDelete
Try {
  Start-Process $exe -ArgumentList $arg -PassThru -Wait -ErrorAction Stop
}
Catch {
  Write-Error "Failed to run SDelete"
  Write-Error $_.Exception
  Exit -1 
}

