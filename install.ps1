#
# Antigravity Docs Installer for Windows
# Installs documentation standards for Google Antigravity/Gemini Code
#

param(
    [switch]$Force
)

$ErrorActionPreference = "Stop"

# GitHub raw URL base
$RepoBase = "https://raw.githubusercontent.com/idiey/antigravity-docs/main"

# Banner
Write-Host ""
Write-Host "╔═══════════════════════════════════════════════════════════╗" -ForegroundColor Blue
Write-Host "║           Antigravity Docs Installer v1.1.0               ║" -ForegroundColor Blue
Write-Host "║     Documentation Standards for Gemini Code Projects      ║" -ForegroundColor Blue
Write-Host "╚═══════════════════════════════════════════════════════════╝" -ForegroundColor Blue
Write-Host ""

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

# Download configuration files
Write-Host "[2/4] Downloading configuration files..." -ForegroundColor Blue

try {
    Invoke-WebRequest -Uri "$RepoBase/.markdownlintrc" -OutFile (Join-Path $GeminiDir ".markdownlintrc")
    Write-Host "  ✓ Downloaded .markdownlintrc" -ForegroundColor Green
} catch {
    Write-Host "  ✗ Failed to download .markdownlintrc: $_" -ForegroundColor Red
}

try {
    Invoke-WebRequest -Uri "$RepoBase/docs-guidelines.md" -OutFile (Join-Path $GeminiDir "docs-guidelines.md")
    Write-Host "  ✓ Downloaded docs-guidelines.md" -ForegroundColor Green
} catch {
    Write-Host "  ✗ Failed to download docs-guidelines.md: $_" -ForegroundColor Red
}

# Download workflow files
Write-Host "[3/4] Downloading workflow files..." -ForegroundColor Blue

$workflows = @(
    "docs.md",
    "docs-init.md",
    "docs-lint.md",
    "docs-audit.md",
    "docs-update-toc.md"
)

foreach ($workflow in $workflows) {
    try {
        Invoke-WebRequest -Uri "$RepoBase/workflows/$workflow" -OutFile (Join-Path $WorkflowsDir $workflow)
        Write-Host "  ✓ Downloaded $workflow" -ForegroundColor Green
    } catch {
        Write-Host "  ✗ Failed to download $workflow" -ForegroundColor Red
    }
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
Write-Host "  /docs           " -ForegroundColor Blue -NoNewline; Write-Host "- View documentation standards"
Write-Host "  /docs-init      " -ForegroundColor Blue -NoNewline; Write-Host "- Initialize docs folder structure"
Write-Host "  /docs-lint      " -ForegroundColor Blue -NoNewline; Write-Host "- Lint markdown files"
Write-Host "  /docs-audit     " -ForegroundColor Blue -NoNewline; Write-Host "- Audit documentation completeness"
Write-Host "  /docs-update-toc" -ForegroundColor Blue -NoNewline; Write-Host "- Update README Table of Contents"
Write-Host ""
Write-Host "Get started by typing " -NoNewline
Write-Host "/docs" -ForegroundColor Yellow -NoNewline
Write-Host " in Antigravity!"
Write-Host ""
