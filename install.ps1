#
# Antigravity Docs Installer for Windows
# Installs documentation standards for Google Antigravity/Gemini Code
#

param(
    [switch]$Force
)

$ErrorActionPreference = "Stop"

# Banner
Write-Host ""
Write-Host "╔═══════════════════════════════════════════════════════════╗" -ForegroundColor Blue
Write-Host "║           Antigravity Docs Installer v1.0.0               ║" -ForegroundColor Blue
Write-Host "║     Documentation Standards for Gemini Code Projects      ║" -ForegroundColor Blue
Write-Host "╚═══════════════════════════════════════════════════════════╝" -ForegroundColor Blue
Write-Host ""

# Determine script directory
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
if (-not $ScriptDir) {
    $ScriptDir = Get-Location
}

# Target directory (Antigravity global config)
$GeminiDir = Join-Path $env:USERPROFILE ".gemini"
$WorkflowsDir = Join-Path $GeminiDir "workflows"

Write-Host "Installing to: $GeminiDir" -ForegroundColor Yellow
Write-Host ""

# Create directories
Write-Host "[1/4] Creating directories..." -ForegroundColor Blue
if (-not (Test-Path $GeminiDir)) {
    New-Item -ItemType Directory -Path $GeminiDir -Force | Out-Null
}
if (-not (Test-Path $WorkflowsDir)) {
    New-Item -ItemType Directory -Path $WorkflowsDir -Force | Out-Null
}
Write-Host "  ✓ Created $GeminiDir" -ForegroundColor Green
Write-Host "  ✓ Created $WorkflowsDir" -ForegroundColor Green

# Copy configuration files
Write-Host "[2/4] Copying configuration files..." -ForegroundColor Blue

$markdownlintrc = Join-Path $ScriptDir ".markdownlintrc"
if (Test-Path $markdownlintrc) {
    Copy-Item $markdownlintrc -Destination (Join-Path $GeminiDir ".markdownlintrc") -Force
    Write-Host "  ✓ Copied .markdownlintrc" -ForegroundColor Green
} else {
    Write-Host "  ⚠ .markdownlintrc not found, skipping" -ForegroundColor Yellow
}

$docsGuidelines = Join-Path $ScriptDir "docs-guidelines.md"
if (Test-Path $docsGuidelines) {
    Copy-Item $docsGuidelines -Destination (Join-Path $GeminiDir "docs-guidelines.md") -Force
    Write-Host "  ✓ Copied docs-guidelines.md" -ForegroundColor Green
} else {
    Write-Host "  ⚠ docs-guidelines.md not found, skipping" -ForegroundColor Yellow
}

# Copy workflow files
Write-Host "[3/4] Copying workflow files..." -ForegroundColor Blue
$workflowsSrc = Join-Path $ScriptDir "workflows"
if (Test-Path $workflowsSrc) {
    Get-ChildItem -Path $workflowsSrc -Filter "*.md" | ForEach-Object {
        Copy-Item $_.FullName -Destination (Join-Path $WorkflowsDir $_.Name) -Force
        Write-Host "  ✓ Copied $($_.Name)" -ForegroundColor Green
    }
} else {
    Write-Host "  ✗ workflows/ directory not found" -ForegroundColor Red
    exit 1
}

# Verify installation
Write-Host "[4/4] Verifying installation..." -ForegroundColor Blue
Write-Host ""
Write-Host "Installed files:" -ForegroundColor Green
Get-ChildItem -Path $GeminiDir -File | ForEach-Object {
    Write-Host "  $($_.Name)"
}
Write-Host ""
Write-Host "Installed workflows:" -ForegroundColor Green
Get-ChildItem -Path $WorkflowsDir -File | ForEach-Object {
    Write-Host "  $($_.Name)"
}
Write-Host ""

# Check for Node.js
Write-Host "Checking dependencies..." -ForegroundColor Blue
try {
    $null = Get-Command npx -ErrorAction Stop
    Write-Host "  ✓ npx is available" -ForegroundColor Green
} catch {
    Write-Host "  ⚠ Node.js/npm not found. Install from https://nodejs.org/" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "╔═══════════════════════════════════════════════════════════╗" -ForegroundColor Green
Write-Host "║              Installation Complete! 🎉                     ║" -ForegroundColor Green
Write-Host "╚═══════════════════════════════════════════════════════════╝" -ForegroundColor Green
Write-Host ""
Write-Host "Available slash commands in Antigravity:"
Write-Host ""
Write-Host "  /docs       " -ForegroundColor Blue -NoNewline; Write-Host "- View documentation standards"
Write-Host "  /docs-init  " -ForegroundColor Blue -NoNewline; Write-Host "- Initialize docs folder structure"
Write-Host "  /docs-lint  " -ForegroundColor Blue -NoNewline; Write-Host "- Lint markdown files"
Write-Host "  /docs-audit " -ForegroundColor Blue -NoNewline; Write-Host "- Audit documentation completeness"
Write-Host ""
Write-Host "Get started by typing " -NoNewline
Write-Host "/docs" -ForegroundColor Yellow -NoNewline
Write-Host " in Antigravity!"
Write-Host ""
