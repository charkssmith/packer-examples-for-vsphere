$ErrorActionPreference = "Stop"

  Try
  {
    Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
  }
  Catch
  {
    Write-Error "Failed to install NuGet"
    Write-Error $_.Exception
    Exit -1 
  }

  Try
  {
    Install-Module VMware.PowerCLI -Scope User -force -SkipPublisherCheck -AllowClobber
  }
  Catch
  {
    Write-Error "Failed to install PowerCLI"
    Write-Error $_.Exception
    Exit -1 
  }

  Try
  {
    Set-PowerCLIConfiguration -Scope User -ParticipateInCEIP $false -Confirm:$false
  }
  Catch
  {
    Write-Error "Failed to turn off ParticipateInCEIP"
    Write-Error $_.Exception
    Exit -1 
  }

  Try
  {
    Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false
  }
  Catch
  {
    Write-Error "Failed to turn off Certificate Validation"
    Write-Error $_.Exception
    Exit -1 
  }


