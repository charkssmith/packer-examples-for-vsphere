$ErrorActionPreference = "Stop"

$installer = "App Volumes Agent.msi"
$appVolumesServer = "vdav01.tamu-commerce.edu"
$listConfig = "/i ""F:\$installer"" /qn REBOOT=ReallySuppress MANAGER_ADDR=$appVolumesServer MANAGER_PORT=443 EnforceSSLCertificateValidation=0"

  Try 
  {
    Start-Process msiexec.exe -ArgumentList $listConfig -PassThru -Wait
  }
  Catch
  {
    Write-Error "Failed to install the AppVolumes Agent"
    Write-Error $_.Exception
    Exit -1 
  }
