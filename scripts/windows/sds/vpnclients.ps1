  $ErrorActionPreference = "Stop"


  Try 
  {
    New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows" -Name "AppInstaller" | Out-Null
    New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\AppInstaller" -Name "EnableBypassCertificatePinningForMicrosoftStore" -Value 1 | Out-Null
  }
  Catch
  {
    Write-Error "Failed to add EnableBypassCertificatePinningForMicrosoftStore"
    Write-Error $_.Exception
    Exit -1 
  }
   
  Try 
  {
    winget install "AnyConnect" --silent --accept-package-agreements --accept-source-agreements
    winget install "GlobalProtect" --silent --accept-package-agreements --accept-source-agreements
    winget install "Forticlient" --silent --accept-package-agreements --accept-source-agreements
    winget install "Pulse Secure" --silent --accept-package-agreements --accept-source-agreements

  }
  Catch
  {
    Write-Error "Failed to install Global Protect"
    Write-Error $_.Exception
    Exit -1 
  }

  Try 
  {
    $xml = '<anyconnect-schema></anyconnect-schema>'
    $sourceXml=New-Object System.Xml.XmlDocument
    $sourceXml.LoadXml($xml)
    Add-VpnConnection -Name "Laredo Community College" -ServerAddress "lccaccess.laredo.edu" -PlugInApplicationID "CiscoSystems.AnyConnect_edjcgkw48dhxt" -CustomConfiguration $sourceXml
    Add-VpnConnection -Name "BPCC" -ServerAddress "fp.bpcc.edu" -PlugInApplicationID "CiscoSystems.AnyConnect_edjcgkw48dhxt" -CustomConfiguration $sourceXml
    Add-VpnConnection -Name "McCombs" -ServerAddress "https://meportal.mccombsplaza.net:10443" -PlugInApplicationID "FortinetInc.FortiClient_sq9g7krz3c65j" -CustomConfiguration $sourceXml
    Add-VpnConnection -Name "City of Cleburne" -ServerAddress "https://vpn.cleburne.net" -PlugInApplicationID "FortinetInc.FortiClient_sq9g7krz3c65j" -CustomConfiguration $sourceXml
    Add-VpnConnection -Name "Little Rock School District" -ServerAddress "lrsdasa.lrsd.org" -PlugInApplicationID "CiscoSystems.AnyConnect_edjcgkw48dhxt" -CustomConfiguration $sourceXml
    Add-VpnConnection -Name "City of Longview" -ServerAddress "remote.longviewtexas.gov" -PlugInApplicationID "PaloAltoNetworks.GlobalProtect_rn9aeerfb38dg" -CustomConfiguration $sourceXml
    Add-VpnConnection -Name "The City of the Colony" -ServerAddress "vpn.thecolony.tech" -PlugInApplicationID "PaloAltoNetworks.GlobalProtect_rn9aeerfb38dg" -CustomConfiguration $sourceXml
    Add-VpnConnection -Name "First Light" -ServerAddress "https://vpn-hq.firstlightfcu.org:55555" -PlugInApplicationID "FortinetInc.FortiClient_sq9g7krz3c65j" -CustomConfiguration $sourceXml
    Write-Host "Installing VPN Configurations... Done!"
  }
  Catch
  {
    Write-Error "Failed to install Any Connect"
    Write-Error $_.Exception
    Exit -1 
  }

 ### Forticlient 9WZDNCRDH6MC http://tlu.dl.delivery.mp.microsoft.com/filestreamingservice/files/3c9f19d2-caf2-4160-8e41-1e79e8f5174d?P1=1691006529&P2=404&P3=2&P4=EWnND%2fjyeS2wITaHh7khrocAFNWBmkGVKN6NkxLSqK3lhaoCDOeFvqhphGiSNOoRSoKyxS8m1w51g7WIulakGg%3d%3d
 ### AnyConnect 9WZDNCRDJ8LH http://tlu.dl.delivery.mp.microsoft.com/filestreamingservice/files/83cbdbcd-7d20-4a9d-905a-caf72f11cf67?P1=1691007062&P2=404&P3=2&P4=cXZp02gyTvomdkGj47Lb%2fYpeOMrXVvXCS6TBHk8bzmzbsofrzOFL9gVIbgA89yfwyyr4F9uHhyGOz%2bm0NAWbOA%3d%3d
 ### GlobalProtect 9NBLGGH6BZL3 http://tlu.dl.delivery.mp.microsoft.com/filestreamingservice/files/b0d8de5d-d539-4c8f-a35f-47c733eb720a?P1=1691006866&P2=404&P3=2&P4=aybCDhxAUkNP4ghXw%2bbDHSE%2fQ0ijWxvg5jFi8UHi8IsbTUGjZ2QTbOHmgwppuizKNUMMdE58fWO%2bHnZwr4UZhA%3d%3d