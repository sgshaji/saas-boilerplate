# scaffold-next.ps1
# Scaffolds a Next.js + TS + ESLint + App-Router project into ./src (no nested src).

# Determine project root (where this script lives)
$projectRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$targetDir   = Join-Path $projectRoot "src"

if (-not (Test-Path $targetDir)) {
    npx create-next-app@latest $targetDir `
      --typescript `         # TypeScript
      --eslint `             # ESLint
      --app `                # App Router
      --import-alias "@/*" ` # @/* imports
      --use-npm `            # npm over yarn
      --skip-install `       # generate files only
      --yes                  # accept defaults

    Write-Host "Next.js + TS scaffolded in $targetDir (deps not installed)."
} else {
    Write-Host "$targetDir already exists; skipping scaffold."
}

Set-Location $targetDir
Write-Host "Now in folder: $(Get-Location)"
