[CmdletBinding()]
param([string]$ApkPath)

$ErrorActionPreference = 'Stop'
if (-not $ApkPath) { $ApkPath = Join-Path $PSScriptRoot '..\sniffies-app-c0f0650.apk' }
$expectedSha256 = 'e1d5df345a1be97b254f0f6d68c68ad99f637e195f58826e6db5e58751d16091'
$sdkRoot = [Environment]::GetEnvironmentVariable('ANDROID_SDK_ROOT', 'Process')
if (-not $sdkRoot) { $sdkRoot = [Environment]::GetEnvironmentVariable('ANDROID_SDK_ROOT', 'User') }
if (-not $sdkRoot) { $sdkRoot = Join-Path $env:LOCALAPPDATA 'Android\Sdk' }
$aapt = Join-Path $sdkRoot 'build-tools\36.0.0\aapt.exe'

if (-not (Test-Path -LiteralPath $ApkPath)) { throw "APK not found: $ApkPath" }
if (-not (Test-Path -LiteralPath $aapt)) { throw "Android Build Tools 36.0.0 was not found: $aapt" }
$stream = [System.IO.File]::OpenRead((Resolve-Path -LiteralPath $ApkPath))
$hasher = [System.Security.Cryptography.SHA256]::Create()
try {
    $actualSha256 = -join ($hasher.ComputeHash($stream) | ForEach-Object { $_.ToString('x2') })
} finally {
    $hasher.Dispose()
    $stream.Dispose()
}
if ($actualSha256 -ne $expectedSha256) { throw "APK checksum mismatch. Expected $expectedSha256; received $actualSha256." }

Write-Host "PASS SHA-256 $actualSha256"
& $aapt dump badging $ApkPath | Select-String -Pattern "^package:|^sdkVersion:|^targetSdkVersion:|^launchable-activity:|^native-code:"
