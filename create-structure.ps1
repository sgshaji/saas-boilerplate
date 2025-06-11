# create-structure.ps1

# Define folders and sample files
$structure = @{
    ".github\workflows"   = @("ci.yml", "tests.yml", "deploy.yml")
    ".docker"             = @("prometheus.yml", "redis.yml", "postgres.yml")
    "prisma"              = @("schema.prisma")
    "docker-compose"      = @("docker-compose.yml", "docker-compose.prod.yml")
    "tests"               = @()
    "docs"                = @("architecture.md", "deployment.md")
    "scripts"             = @("migrate.ps1", "backup.ps1", "health-check.ps1")
    "public"              = @("favicon.ico", "robots.txt")
}

foreach ($folder in $structure.Keys) {
    if (-not (Test-Path $folder)) {
        New-Item -ItemType Directory -Path $folder -Force | Out-Null
        Write-Host "Created folder: $folder"
    }
    foreach ($file in $structure[$folder]) {
        $filePath = Join-Path $folder $file
        if (-not (Test-Path $filePath)) {
            New-Item -ItemType File -Path $filePath | Out-Null
            Write-Host "Created file: $filePath"
        }
    }
}
