#--------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See LICENSE in the project root for
# license information.
# --------------------------------------------------------------------------

param(
    [Parameter(ValueFromPipeline = $True, Mandatory = $True)]
    [string]$appName,
    [Parameter(ValueFromPipeline = $True, Mandatory = $True)]
    [string]$appProcessName,
    [Parameter(ValueFromPipeline = $True, Mandatory = $True)]
    [string]$msiName,
    [Parameter(ValueFromPipeline = $True, Mandatory = $True)]
    [string]$configFilePath    
)

Write-Host "appName : $appName"
Write-Host "appProcessName : $appProcessName"
Write-Host "msiName : $msiName"
Write-Host "configFilePath : $configFilePath"

$jsonContent = @"
{
    "appName"   : "$appName",
    "appProcessName"   : "$appProcessName",
    "msiName"   : "$msiName"
} 
"@

$jsonPath = [string]::Format("{0}/{1}", $configFilePath, "config.json")
$jsonContent.Replace('\','\\') | Out-File $jsonPath -Encoding utf8
