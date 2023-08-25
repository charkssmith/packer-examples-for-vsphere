$ErrorActionPreference = "Stop"

  # Enable NFS-Client
  Try
  {
    Enable-WindowsOptionalFeature -FeatureName ServicesForNFS-ClientOnly, ClientForNFS-Infrastructure -Online -NoRestart
    Start-Sleep -s 600
  }
  Catch
  {
    Write-Error "Cannot install NFS-Client"
    Write-Error $_.Exception
    Exit -1 
  }
