[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$javaHome = [Environment]::GetEnvironmentVariable('JAVA_HOME', 'User')
if (-not $javaHome) { $javaHome = 'C:\Program Files\Eclipse Adoptium\jdk-21.0.12.101-hotspot' }
$sdkRoot = [Environment]::GetEnvironmentVariable('ANDROID_SDK_ROOT', 'User')
if (-not $sdkRoot) { $sdkRoot = Join-Path $env:LOCALAPPDATA 'Android\Sdk' }
$gradleWrapper = Join-Path $PSScriptRoot '..\app\android\gradlew.bat'

if (-not (Test-Path -LiteralPath (Join-Path $javaHome 'bin\java.exe'))) { throw "A usable JDK was not found at $javaHome" }
if (-not (Test-Path -LiteralPath (Join-Path $sdkRoot 'platforms\android-36\android.jar'))) { throw "Android SDK platform 36 was not found at $sdkRoot" }
if (-not (Test-Path -LiteralPath $gradleWrapper)) { throw "Gradle wrapper not found: $gradleWrapper" }

$env:JAVA_HOME = $javaHome
$env:ANDROID_SDK_ROOT = $sdkRoot
$env:ANDROID_HOME = $sdkRoot
Push-Location (Split-Path -Parent $gradleWrapper)
try {
    & $gradleWrapper assembleDebug
    if ($LASTEXITCODE -ne 0) { throw "Gradle failed with exit code $LASTEXITCODE" }
} finally {
    Pop-Location
}
