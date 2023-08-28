param(
    [string] $SOFTWARE_DATASTORE = $env:SOFTWARE_DATASTORE,
    [string] $VSPHERE_ENDPOINT = $env:VSPHERE_ENDPOINT,
    [string] $VSPHERE_USERNAME = $env:VSPHERE_USERNAME,
    [string] $VSPHERE_PASSWORD = $env:VSPHERE_PASSWORD

)


$ErrorActionPreference = "Stop"

### Connect to vCenter ###
Try
{
  Connect-VIServer $VSPHERE_ENDPOINT -User $VSPHERE_USERNAME -Password $VSPHERE_PASSWORD
}
Catch
{
  Write-Error "Failed to connect to vCenter"
  Write-Error $_.Exception
  Exit -1 
}

### Set Powershell Drive ###
Try
{
  New-PSDrive -Location (Get-Datastore $SOFTWARE_DATASTORE) -Name DS -PSProvider VimDatastore  -Root "\" > $null -Scope Global
}
Catch
{
  Write-Error "Failed to set PS-Drive to Datastore"
  Write-Error $_.Exception
  Exit -1 
}

Try 
{
  Copy-DatastoreItem -Item DS:\Packer\* -Destination $env:TEMP\ -PassThru
}
Catch
{
  Write-Error "Failed to copy all datastore files locally"
  Write-Error $_.Exception
  Exit -1 
}

Try 
{
  dir $env:TEMP\ | Unblock-File -Confirm:$false
}
Catch
{
  Write-Error "Failed to Unblock files"
  Write-Error $_.Exception
  Exit -1 
}
