Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Value 0 -Type Dword -Force;
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name SystemUsesLightTheme -Value 0 -Type Dword -Force;
Set-ItemProperty -Path "HKCU:Control Panel\Desktop" -name WallPaper -value C:\Windows\web\wallpaper\Windows\img19.jpg

Remove-AppxPackage Clipchamp.Clipchamp_2.2.8.0_neutral__yxz26nhyzhsrt
Remove-AppxPackage Microsoft.People_10.1909.12456.0_arm64__8wekyb3d8bbwe
Remove-AppxPackage Microsoft.YourPhone_0.22022.147.0_x64__8wekyb3d8bbwe
Remove-AppPackage Microsoft.MicrosoftSolitaireCollection_4.12.3171.0_arm64__8wekyb3d8bbwe
Remove-AppxPackage Microsoft.MicrosoftOfficeHub_18.2204.1141.0_x64__8wekyb3d8bbwe
Remove-AppPackage Microsoft.WindowsFeedbackHub_1.2201.61.0_arm64__8wekyb3d8bbwe
Remove-AppPackage Microsoft.WindowsMaps_1.0.39.0_arm64__8wekyb3d8bbwe
Remove-AppxPackage Microsoft.WindowsSoundRecorder_1.0.42.0_arm64__8wekyb3d8bbwe
Remove-AppxPackage Microsoft.YourPhone_0.22022.147.0_x64__8wekyb3d8bbwe