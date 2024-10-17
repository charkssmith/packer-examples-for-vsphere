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
    ### Install Global Protect ###
    Start-Process "msiexec.exe" -ArgumentList "/i $env:TEMP\GlobalProtect64.msi /quiet" -Wait
    New-Item -Path "HKCU:\Software\Palo Alto Networks\GlobalProtect\Settings\vpn.tamug.edu"
    New-Item -Path "HKCU:\Software\Palo Alto Networks\GlobalProtect\Settings\remote.longviewtexas.gov"
    New-Item -Path "HKCU:\Software\Palo Alto Networks\GlobalProtect\Settings\vpn.thecolony.tech"
  }
  Catch
  {
    Write-Error "Failed to install Global Protect"
    Write-Error $_.Exception
    Exit -1 
  }

  Try 
  {
    ### Install Any Connect ###
    Start-Process "msiexec.exe" -ArgumentList "/i C:\vpnclients\anyconnect-win-arm64-4.10.07061-core-vpn-predeploy-k9.msi /quiet" -Wait
  }
  Catch
  {
    Write-Error "Failed to install Any Connect"
    Write-Error $_.Exception
    Exit -1 
  }

   Try 
  {
    ### Install Any Connect ###
    Start-Process "FortiClientOnlineInstaller.exe /quiet" -Wait
  }
  Catch
  {
    Write-Error "Failed to install Forticlient"
    Write-Error $_.Exception
    Exit -1 
  }
 ### Forticlient 9WZDNCRDH6MC http://tlu.dl.delivery.mp.microsoft.com/filestreamingservice/files/3c9f19d2-caf2-4160-8e41-1e79e8f5174d?P1=1691006529&P2=404&P3=2&P4=EWnND%2fjyeS2wITaHh7khrocAFNWBmkGVKN6NkxLSqK3lhaoCDOeFvqhphGiSNOoRSoKyxS8m1w51g7WIulakGg%3d%3d
 ### AnyConnect 9WZDNCRDJ8LH http://tlu.dl.delivery.mp.microsoft.com/filestreamingservice/files/83cbdbcd-7d20-4a9d-905a-caf72f11cf67?P1=1691007062&P2=404&P3=2&P4=cXZp02gyTvomdkGj47Lb%2fYpeOMrXVvXCS6TBHk8bzmzbsofrzOFL9gVIbgA89yfwyyr4F9uHhyGOz%2bm0NAWbOA%3d%3d
 ### GlobalProtect 9NBLGGH6BZL3 http://tlu.dl.delivery.mp.microsoft.com/filestreamingservice/files/b0d8de5d-d539-4c8f-a35f-47c733eb720a?P1=1691006866&P2=404&P3=2&P4=aybCDhxAUkNP4ghXw%2bbDHSE%2fQ0ijWxvg5jFi8UHi8IsbTUGjZ2QTbOHmgwppuizKNUMMdE58fWO%2bHnZwr4UZhA%3d%3d