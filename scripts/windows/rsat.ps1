$ErrorActionPreference = "Stop"

Get-WindowsCapability -Name RSAT* -Online | Add-WindowsCapability -Online
Remove-Item "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Administrative Tools\Active Directory Administrative Center.lnk" -Force
Remove-Item "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Administrative Tools\Active Directory Domains and Trusts.lnk" -Force
Remove-Item "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Administrative Tools\Active Directory PowerShell Snap-In.lnk" -Force
Remove-Item "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Administrative Tools\Active Directory Sites and Services.lnk" -Force
Remove-Item "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Administrative Tools\Active Directory Users and Computers.lnk" -Force
Remove-Item "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Administrative Tools\ADSIEdit.lnk" -Force
Remove-Item "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Administrative Tools\Certification Authority.lnk" -Force
Remove-Item "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Administrative Tools\Cluster-Aware Updating.lnk" -Force
Remove-Item "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Administrative Tools\DFS Management.lnk" -Force
Remove-Item "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Administrative Tools\dhcp.lnk" -Force
Remove-Item "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Administrative Tools\DNS.lnk" -Force
Remove-Item "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Administrative Tools\Failover Cluster Manager.lnk" -Force
Remove-Item "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Administrative Tools\File Server Resource Manager.lnk" -Force
Remove-Item "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Administrative Tools\Group Policy Management.lnk" -Force
Remove-Item "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Administrative Tools\Microsoft Azure services.lnk" -Force
Remove-Item "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Administrative Tools\Network Load Balancing Manager.lnk" -Force
Remove-Item "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Administrative Tools\Routing and Remote Access.lnk" -Force
Remove-Item "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Administrative Tools\Server Manager.lnk" -Force
Remove-Item "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Administrative Tools\VATools.lnk" -Force
Remove-Item "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Administrative Tools\Windows Server Update Services.lnk" -Force
Remove-Item "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Server Manager.lnk" -Force