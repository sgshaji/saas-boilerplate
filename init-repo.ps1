# init-repo.ps1
# 1. Initialize Git if needed
if (-not (Test-Path .git)) {
    git init
    Write-Host "Git repository initialized."
} else {
    Write-Host "Git repository already exists."
}

# 2. Create .gitignore
"node_modules/","*.env","dist/",".DS_Store" |
    Out-File -Encoding UTF8 .gitignore
Write-Host ".gitignore created."

# 3. Create LICENSE
if (-not (Test-Path LICENSE)) {
    "MIT License placeholder. Replace with your license text." |
        Out-File -Encoding UTF8 LICENSE
    Write-Host "LICENSE created."
} else {
    Write-Host "LICENSE already exists."
}

# 4. Create README.md
if (-not (Test-Path README.md)) {
    @"
# SaaS Boilerplate

Project overview, tech stack, and setup instructions.
"@ |
        Out-File -Encoding UTF8 README.md
    Write-Host "README.md created."
} else {
    Write-Host "README.md already exists."
}

# 5. Create CODE_OF_CONDUCT.md
if (-not (Test-Path CODE_OF_CONDUCT.md)) {
    "Code of Conduct guidelines for respectful collaboration." |
        Out-File -Encoding UTF8 CODE_OF_CONDUCT.md
    Write-Host "CODE_OF_CONDUCT.md created."
} else {
    Write-Host "CODE_OF_CONDUCT.md already exists."
}

# 6. Create CONTRIBUTING.md
if (-not (Test-Path CONTRIBUTING.md)) {
    "Contributing guidelines: how to file issues, create branches, and open PRs." |
        Out-File -Encoding UTF8 CONTRIBUTING.md
    Write-Host "CONTRIBUTING.md created."
} else {
    Write-Host "CONTRIBUTING.md already exists."
}
