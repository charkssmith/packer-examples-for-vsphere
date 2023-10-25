$ErrorActionPreference = "Stop"

$installer = "Bginfo64.exe"
$configFile = "bgconfig.bgi"

$targetFolder = "C:\Program Files\Bginfo"
New-Item $targetFolder -Itemtype Directory

ForEach ($file in $configFile) {
    Copy-Item -Path $env:TEMP\$file -Destination $targetFolder\$file
    }