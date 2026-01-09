# Pre-commit hook for markdown linting (PowerShell)
# Copy to .git\hooks\pre-commit.ps1
# Create .git\hooks\pre-commit with: powershell -ExecutionPolicy Bypass -File .git\hooks\pre-commit.ps1

$stagedFiles = git diff --cached --name-only --diff-filter=ACM | Where-Object { $_ -match '\.md$' }

if ($stagedFiles) {
    Write-Host "🔍 Linting staged markdown files..." -ForegroundColor Cyan
    
    # Check if npx is available
    $npxPath = Get-Command npx -ErrorAction SilentlyContinue
    if (-not $npxPath) {
        Write-Host "⚠️  npx not found. Skipping markdown lint." -ForegroundColor Yellow
        exit 0
    }
    
    # Run linter
    $result = npx markdownlint-cli2 $stagedFiles 2>&1
    
    if ($LASTEXITCODE -ne 0) {
        Write-Host ""
        Write-Host "❌ Markdown linting failed!" -ForegroundColor Red
        Write-Host $result
        Write-Host ""
        Write-Host "   Fix issues above or use: git commit --no-verify" -ForegroundColor Yellow
        exit 1
    }
    
    Write-Host "✅ Markdown linting passed!" -ForegroundColor Green
}

exit 0
