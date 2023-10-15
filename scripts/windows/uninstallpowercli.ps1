$ErrorActionPreference = "Stop"

  Try
  {
    (Get-Module VMware.PowerCLI -ListAvailable).RequiredModules | Uninstall-Module -Force
  }
  Catch
  {
    Write-Error "Failed to uninstall Powercli Required modules"
    Write-Error $_.Exception
    Exit -1 
  }

  Try
  {
    Get-Module VMware.PowerCLI -ListAvailable | Uninstall-Module -Force
  }
  Catch
  {
    Write-Error "Failed to uninstall Powercli"
    Write-Error $_.Exception
    Exit -1 
  }

