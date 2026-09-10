[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'

function Get-ConfiguredPath {
    param([string]$Name, [string]$Fallback)

    foreach ($candidate in @([Environment]::GetEnvironmentVariable($Name, 'Process'), [Environment]::GetEnvironmentVariable($Name, 'User'), $Fallback)) {
        if ($candidate -and (Test-Path -LiteralPath $candidate)) { return $candidate }
    }
    return $null
}

$failures = [System.Collections.Generic.List[string]]::new()
$javaHome = Get-ConfiguredPath -Name 'JAVA_HOME' -Fallback 'C:\Program Files\Eclipse Adoptium\jdk-21.0.12.101-hotspot'
$sdkRoot = Get-ConfiguredPath -Name 'ANDROID_SDK_ROOT' -Fallback "$env:LOCALAPPDATA\Android\Sdk"
$node = Get-Command node -ErrorAction SilentlyContinue

if (-not $node) {
    $failures.Add('Node.js 24 or newer was not found on PATH.')
} else {
    $nodeVersion = (& $node.Source --version).Trim().TrimStart('v')
    if ([version]$nodeVersion -lt [version]'24.0.0') { $failures.Add("Node.js 24 or newer is required; found $nodeVersion.") } else { Write-Host "PASS Node.js $nodeVersion" }
}

if (-not $javaHome -or -not (Test-Path -LiteralPath (Join-Path $javaHome 'bin\java.exe'))) {
    $failures.Add('A valid JAVA_HOME with bin\\java.exe was not found.')
} else {
    $savedErrorAction = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    & (Join-Path $javaHome 'bin\java.exe') -version *> $null
    $javaExitCode = $LASTEXITCODE
    $ErrorActionPreference = $savedErrorAction
    if ($javaExitCode -ne 0) { $failures.Add("Java at $javaHome could not run.") } else { Write-Host "PASS JDK $javaHome" }
}

if (-not $sdkRoot) {
    $failures.Add('ANDROID_SDK_ROOT was not found.')
} else {
    foreach ($relativePath in @('platform-tools\adb.exe', 'platforms\android-36\android.jar', 'build-tools\36.0.0\aapt.exe')) {
        if (-not (Test-Path -LiteralPath (Join-Path $sdkRoot $relativePath))) { $failures.Add("Missing Android SDK component: $relativePath") }
    }
    if ($failures.Count -eq 0) { Write-Host "PASS Android SDK $sdkRoot" }
}

if ($failures.Count -gt 0) { $failures | ForEach-Object { Write-Error $_ }; exit 1 }
Write-Host 'Android workbench prerequisites are ready.'
