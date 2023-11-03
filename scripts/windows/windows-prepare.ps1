# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
# WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
# COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
# OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

<#
    .DESCRIPTION
    Prepares a Windows guest operating system.
#>

param(
    [string] $BUILD_USERNAME = $env:BUILD_USERNAME
)

$ErrorActionPreference = "Stop"

# Optional: Import the Root CA certificate to the Trusted Root Certification Authorities.
# This option will require the use of a file provisioner to copy the certificate to the guest.
# Write-Output "Importing the Root CA certificate to the Trusted Root Certification Authorities..."
# Import-Certificate -FilePath C:\windows\temp\root-ca.cer -CertStoreLocation 'Cert:\LocalMachine\Root' | Out-Null
# Remove-Item C:\windows\temp\root-ca.cer -Confirm:$false

# Optional: Import the Issuing CA certificate to the Trusted Root Certification Authoriries.
# This option will require the use of a file provisioner to copy the certificate to the guest.
# Write-Output "Importing the Issuing CA certificate to the Trusted Root Certification Authoriries..."
# Import-Certificate -FilePath C:\windows\temp\issuing-ca.cer -CertStoreLocation 'Cert:\LocalMachine\CA' | Out-Null
# Remove-Item C:\windows\temp\issuing-ca.cer -Confirm:$false

# Set the Windows Explorer options.
Write-Output "Setting the Windows Explorer options..."
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Hidden" -Value 1 | Out-Null
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "HideFileExt" -Value 0 | Out-Null
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "HideDrivesWithNoMedia" -Value 0 | Out-Null
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowSyncProviderNotifications" -Value 0 | Out-Null

# Disable system hibernation.
Write-Output "Disabling system hibernation..."
Set-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Power\" -Name "HiberFileSizePercent" -Value 0 | Out-Null
Set-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Power\" -Name "HibernateEnabled" -Value 0 | Out-Null

# Disable TLS 1.0.s
Write-Output "Disabling TLS 1.0..."
New-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols" -Name "TLS 1.0" | Out-Null
New-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0" -Name "Server" | Out-Null
New-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0" -Name "Client" | Out-Null
New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Client" -Name "Enabled" -Value 0 | Out-Null
New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Client" -Name "DisabledByDefault" -Value 1 | Out-Null
New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server" -Name "Enabled" -Value 0 | Out-Null
New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server" -Name "DisabledByDefault" -Value 1 | Out-Null

# Disable TLS 1.1.
Write-Output "Disabling TLS 1.1..."
New-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols" -Name "TLS 1.1" | Out-Null
New-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1" -Name "Server" | Out-Null
New-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1" -Name "Client" | Out-Null
New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Client" -Name "Enabled" -Value 0 | Out-Null
New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Client" -Name "DisabledByDefault" -Value 1 | Out-Null
New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Server" -Name "Enabled" -Value 0 | Out-Null
New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Server" -Name "DisabledByDefault" -Value 1 | Out-Null

# Disable Password Expiration for the Administrator Accounts - (Administrator and Build)
Write-Output "Disabling password expiration for the local Administrator accounts..."
$localAdministrator = (Get-LocalUser | Where-Object { $_.sid -like '*-500' }).name
Set-LocalUser -Name $localAdministrator -PasswordNeverExpires $true
Set-LocalUser -Name $BUILD_USERNAME -PasswordNeverExpires $true

# Enable Remote Desktop.
Write-Output "Enabling Remote Desktop..."
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections" -Value 0 | Out-Null
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -name "UserAuthentication" -Value 0
Enable-NetFirewallRule -Group '@FirewallAPI.dll,-28752'

# Disable Power Options
Write-Output "Disabling Power Options..."
#New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\309dce9b-bef4-4119-9921-a851fb12f0f4" -Name "ACSettingIndex" -Value 0 | Out-Null
#New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\6738e2c4-e8a5-4a42-b16a-e040e769756e" -Name "Attributes" -Value 1 | Out-Null
#New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Power\PowerSettings" -Name "ActivePowerScheme" -Value "8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" | Out-Null
#New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\29F6C1DB-86DA-48C5-9FDB-F2B67B1F44DA" -Name "ACSettingIndex" -Value 0 | Out-Null
#New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\3C0BC021-C8A8-4E07-A973-6B14CBCB2B7E" -Name "ACSettingIndex" -Value 0 | Out-Null
#New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\6738E2C4-E8A5-4A42-B16A-E040E769756E" -Name "ACSettingIndex" -Value 0 | Out-Null
#New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\94ac6d29-73ce-41a6-809f-6363ba21b47e" -Name "ACSettingIndex" -Value 0 | Out-Null
#New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\9D7815A6-7EE4-497E-8888-515A05F02364" -Name "ACSettingIndex" -Value 0 | Out-Null
#Set-Service -Name "Power" -Status stopped -StartupType disabled
powercfg -change -disk-timeout-ac 0
powercfg -change -disk-timeout-dc 0
powercfg -H OFF
powercfg -change -monitor-timeout-ac 0
powercfg -change -monitor-timeout-dc 0

# Set Time Zone
Set-Timezone -Id "Central Standard Time"

