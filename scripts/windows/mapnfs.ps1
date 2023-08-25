$ErrorActionPreference = "Stop"

 # Enable Map I Drive to NFS
  Try
  {
    New-PSdrive -PSProvider FileSystem -Name I -Root \\10.0.2.5\volume2\Software -Scope Global -Persist
  }
  Catch
  {
    Write-Error "Cannot Map NFS Share"
    Write-Error $_.Exception
    Exit -1 
  }
