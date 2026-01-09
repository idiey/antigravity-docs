#
# Antigravity Docs Installer for Windows
# Documentation Standards for Google Antigravity/Gemini Code
# Version: 1.1.0
# Usage: irm https://raw.githubusercontent.com/idiey/antigravity-docs/main/install.ps1 | iex
#

param(
    [switch]$Force
)

$ErrorActionPreference = "Stop"

Write-Host ""
Write-Host "🚀 Installing Antigravity Documentation Standards" -ForegroundColor Blue
Write-Host "==================================================" -ForegroundColor Blue
Write-Host ""

# GitHub raw URL base
$RepoBase = "https://raw.githubusercontent.com/idiey/antigravity-docs/main"

# Detect installation mode
$InstallMode = "remote"
if ((Test-Path ".git") -and (Test-Path "docs-guidelines.md")) {
    $InstallMode = "local"
    $RepoDir = Get-Location
    Write-Host "ℹ️  Installing from local repository" -ForegroundColor Blue
} else {
    Write-Host "ℹ️  Installing from remote repository" -ForegroundColor Blue
}

Write-Host ""

# Target directories
$GeminiDir = Join-Path $env:USERPROFILE ".gemini"
$WorkflowsDir = Join-Path $GeminiDir "workflows"

# Create directories
if (-not (Test-Path $GeminiDir)) {
    Write-Host "Creating ~/.gemini directory..." -ForegroundColor Yellow
    New-Item -ItemType Directory -Path $GeminiDir -Force | Out-Null
}

if (-not (Test-Path $WorkflowsDir)) {
    Write-Host "Creating ~/.gemini/workflows directory..." -ForegroundColor Yellow
    New-Item -ItemType Directory -Path $WorkflowsDir -Force | Out-Null
}

# Check for npm
$SkipLinter = $false
try {
    $null = Get-Command npm -ErrorAction Stop
} catch {
    Write-Host "⚠️  Warning: npm not found. Skipping markdownlint installation." -ForegroundColor Yellow
    Write-Host "   Install Node.js/npm to enable markdown linting." -ForegroundColor Yellow
    $SkipLinter = $true
}

# Function to install file
function Install-File {
    param(
        [string]$SourceFile,
        [string]$DestFile,
        [string]$FileDesc
    )

    if ((Test-Path $DestFile) -and -not $Force) {
        Write-Host "⚠️  $FileDesc already exists" -ForegroundColor Yellow
        $response = Read-Host "Overwrite? (y/N)"
        if ($response -notmatch "^[Yy]$") {
            Write-Host "Skipping $FileDesc" -ForegroundColor Yellow
            return $false
        }
    }

    try {
        if ($InstallMode -eq "local") {
            Copy-Item -Path (Join-Path $RepoDir $SourceFile) -Destination $DestFile -Force
        } else {
            Invoke-WebRequest -Uri "$RepoBase/$SourceFile" -OutFile $DestFile -ErrorAction Stop
        }
        Write-Host "✓ $FileDesc installed" -ForegroundColor Green
        return $true
    } catch {
        Write-Host "✗ Failed to install $FileDesc : $_" -ForegroundColor Red
        return $false
    }
}

Write-Host "📦 Installing files..." -ForegroundColor Blue
Write-Host ""

# Install markdownlint-cli2 globally
if (-not $SkipLinter) {
    Write-Host "Installing markdownlint-cli2..."
    try {
        npm install -g markdownlint-cli2 2>$null | Out-Null
        Write-Host "✓ markdownlint-cli2 installed" -ForegroundColor Green
    } catch {
        Write-Host "⚠️  Warning: Failed to install markdownlint-cli2" -ForegroundColor Yellow
        Write-Host "   You can install it manually: npm install -g markdownlint-cli2" -ForegroundColor Yellow
    }
    Write-Host ""
}

# Install configuration files
Install-File "docs-guidelines.md" (Join-Path $GeminiDir "docs-guidelines.md") "Documentation guidelines"
Install-File ".markdownlint.json" (Join-Path $GeminiDir ".markdownlint.json") "Markdownlint configuration"

# Install workflow files
Install-File "workflows/docs.md" (Join-Path $WorkflowsDir "docs.md") "/docs command"
Install-File "workflows/docs-init.md" (Join-Path $WorkflowsDir "docs-init.md") "/docs-init command"
Install-File "workflows/docs-lint.md" (Join-Path $WorkflowsDir "docs-lint.md") "/docs-lint command"
Install-File "workflows/docs-audit.md" (Join-Path $WorkflowsDir "docs-audit.md") "/docs-audit command"
Install-File "workflows/docs-update-toc.md" (Join-Path $WorkflowsDir "docs-update-toc.md") "/docs-update-toc command"

Write-Host ""
Write-Host "✅ Antigravity Documentation Standards installed successfully!" -ForegroundColor Green
Write-Host ""
Write-Host "📖 Usage:"
Write-Host "   /docs              - View documentation standards and templates"
Write-Host "   /docs-init         - Initialize docs folder structure"
Write-Host "   /docs-lint         - Lint and fix markdown files"
Write-Host "   /docs-audit        - Audit documentation completeness"
Write-Host "   /docs-update-toc   - Update Table of Contents"
Write-Host ""
Write-Host "📋 Guidelines Location:"
Write-Host "   ~/.gemini/docs-guidelines.md"
Write-Host ""
if (-not $SkipLinter) {
    Write-Host "🔍 Linting Commands:"
    Write-Host "   npx markdownlint-cli2 `"docs/**/*.md`"      - Lint all markdown files"
    Write-Host "   npx markdownlint-cli2 --fix `"docs/*.md`"   - Auto-fix markdown issues"
    Write-Host ""
}
Write-Host "📚 Full README:"
if ($InstallMode -eq "local") {
    Write-Host "   Get-Content $RepoDir\README.md"
} else {
    Write-Host "   https://github.com/idiey/antigravity-docs"
}
Write-Host ""
Write-Host "🎉 You're all set! Try '/docs' in any project with Antigravity!" -ForegroundColor Green
Write-Host ""
