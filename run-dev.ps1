# run-dev.ps1
# 1. Ensure logs/ exists
$logs = Join-Path $PSScriptRoot 'logs'
if (-not (Test-Path $logs)) { New-Item -ItemType Directory -Path $logs | Out-Null }

# 2. Switch into src/ and start the dev server, capturing all output
Set-Location (Join-Path $PSScriptRoot 'src')
npm run dev 2>&1 | Tee-Object -FilePath (Join-Path $logs 'dev.log')
