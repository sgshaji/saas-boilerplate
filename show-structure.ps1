# show-structure.ps1
# Generates a listing of all files and folders, excluding node_modules.

# 1. Get the project root path
$projectRoot = Get-Location

# 2. Find all items recursively, filter out node_modules, and sort
$items = Get-ChildItem -Path $projectRoot -Recurse -Force |
    Where-Object { $_.FullName -notmatch '\\node_modules\\' } |
    Sort-Object FullName

# 3. Convert full paths to relative paths
$relative = $items | ForEach-Object {
    $_.FullName.Substring($projectRoot.Path.Length + 1)
}

# 4. Output to console
$relative | ForEach-Object { Write-Host $_ }

# 5. (Optional) Save to a text file
$relative | Out-File -Encoding UTF8 structure.txt
Write-Host "`nStructure saved to structure.txt"
