param()
$ErrorActionPreference = 'Stop'
# The desktop app may be named ChatGPT.exe even though its package is OpenAI.Codex.
$running = Get-Process ChatGPT,Codex -ErrorAction SilentlyContinue | Where-Object {
    $_.Path -match 'OpenAI.Codex.*\\app\\|OpenAI\\Codex\\app\\'
}
if ($running) { return }
$package = Get-AppxPackage OpenAI.Codex | Select-Object -First 1
if (-not $package) { throw 'Codex desktop app not installed for this Windows user.' }
$manifest = Get-AppxPackageManifest -Package $package.PackageFullName
$appId = @($manifest.Package.Applications.Application)[0].Id
Start-Process explorer.exe -ArgumentList ("shell:AppsFolder\" + $package.PackageFamilyName + "!" + $appId)
