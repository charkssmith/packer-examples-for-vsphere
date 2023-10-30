  $ErrorActionPreference = "Stop"


  Try 
  {
    Add-AppxPackage -Path 'https://github.com/microsoft/winget-cli/releases/download/v1.6.2771/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle'
  }
  Catch
  {
    Write-Error "Failed to upgrade WINGET"
    Write-Error $_.Exception
    Exit -1 
  }

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
    Start-Process winget -ArgumentList "install -e -i --id=9WZDNCRDH6MC --source=msstore --accept-package-agreements --accept-source-agreements"
    Start-Process winget -ArgumentList "install -e -i --id=9WZDNCRDJ8LH --source=msstore --accept-package-agreements --accept-source-agreements"
    Start-Process winget -ArgumentList "install -e -i --id=9NBLGGH6BZL3 --source=msstore --accept-package-agreements --accept-source-agreements"
  }
  Catch
  {
    Write-Error "Failed to install VPN Clients"
    Write-Error $_.Exception
    Exit -1 
  }

  Try 
  {
    Copy-Item $env:TEMP\rasphone.pbk C:\ProgramData\Microsoft\Network\Connections\Pbk
  }
  Catch
  {
    Write-Error "Failed to add VPN Connections"
    Write-Error $_.Exception
    Exit -1 
  }
 ### Forticlient 9WZDNCRDH6MC http://tlu.dl.delivery.mp.microsoft.com/filestreamingservice/files/3c9f19d2-caf2-4160-8e41-1e79e8f5174d?P1=1691006529&P2=404&P3=2&P4=EWnND%2fjyeS2wITaHh7khrocAFNWBmkGVKN6NkxLSqK3lhaoCDOeFvqhphGiSNOoRSoKyxS8m1w51g7WIulakGg%3d%3d
 ### AnyConnect 9WZDNCRDJ8LH http://tlu.dl.delivery.mp.microsoft.com/filestreamingservice/files/83cbdbcd-7d20-4a9d-905a-caf72f11cf67?P1=1691007062&P2=404&P3=2&P4=cXZp02gyTvomdkGj47Lb%2fYpeOMrXVvXCS6TBHk8bzmzbsofrzOFL9gVIbgA89yfwyyr4F9uHhyGOz%2bm0NAWbOA%3d%3d
 ### GlobalProtect 9NBLGGH6BZL3 http://tlu.dl.delivery.mp.microsoft.com/filestreamingservice/files/b0d8de5d-d539-4c8f-a35f-47c733eb720a?P1=1691006866&P2=404&P3=2&P4=aybCDhxAUkNP4ghXw%2bbDHSE%2fQ0ijWxvg5jFi8UHi8IsbTUGjZ2QTbOHmgwppuizKNUMMdE58fWO%2bHnZwr4UZhA%3d%3d