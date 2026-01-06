#!/bin/bash
#
# Antigravity Docs Installer
# Installs documentation standards for Google Antigravity/Gemini Code
#

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}"
echo "╔═══════════════════════════════════════════════════════════╗"
echo "║           Antigravity Docs Installer v1.0.0               ║"
echo "║     Documentation Standards for Gemini Code Projects      ║"
echo "╚═══════════════════════════════════════════════════════════╝"
echo -e "${NC}"

# Determine script directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Target directory (Antigravity global config)
GEMINI_DIR="$HOME/.gemini"
WORKFLOWS_DIR="$GEMINI_DIR/workflows"

echo -e "${YELLOW}Installing to: $GEMINI_DIR${NC}"
echo ""

# Create directories
echo -e "${BLUE}[1/4]${NC} Creating directories..."
mkdir -p "$GEMINI_DIR"
mkdir -p "$WORKFLOWS_DIR"
echo -e "${GREEN}  ✓ Created $GEMINI_DIR${NC}"
echo -e "${GREEN}  ✓ Created $WORKFLOWS_DIR${NC}"

# Copy configuration files
echo -e "${BLUE}[2/4]${NC} Copying configuration files..."
if [ -f "$SCRIPT_DIR/.markdownlintrc" ]; then
    cp "$SCRIPT_DIR/.markdownlintrc" "$GEMINI_DIR/.markdownlintrc"
    echo -e "${GREEN}  ✓ Copied .markdownlintrc${NC}"
else
    echo -e "${YELLOW}  ⚠ .markdownlintrc not found, skipping${NC}"
fi

if [ -f "$SCRIPT_DIR/docs-guidelines.md" ]; then
    cp "$SCRIPT_DIR/docs-guidelines.md" "$GEMINI_DIR/docs-guidelines.md"
    echo -e "${GREEN}  ✓ Copied docs-guidelines.md${NC}"
else
    echo -e "${YELLOW}  ⚠ docs-guidelines.md not found, skipping${NC}"
fi

# Copy workflow files
echo -e "${BLUE}[3/4]${NC} Copying workflow files..."
if [ -d "$SCRIPT_DIR/workflows" ]; then
    for workflow in "$SCRIPT_DIR/workflows"/*.md; do
        if [ -f "$workflow" ]; then
            filename=$(basename "$workflow")
            cp "$workflow" "$WORKFLOWS_DIR/$filename"
            echo -e "${GREEN}  ✓ Copied $filename${NC}"
        fi
    done
else
    echo -e "${RED}  ✗ workflows/ directory not found${NC}"
    exit 1
fi

# Verify installation
echo -e "${BLUE}[4/4]${NC} Verifying installation..."
echo ""
echo -e "${GREEN}Installed files:${NC}"
echo ""
ls -la "$GEMINI_DIR" 2>/dev/null | grep -E "^-" | awk '{print "  " $NF}'
echo ""
echo -e "${GREEN}Installed workflows:${NC}"
echo ""
ls -la "$WORKFLOWS_DIR" 2>/dev/null | grep -E "^-" | awk '{print "  " $NF}'
echo ""

# Check for markdownlint
echo -e "${BLUE}Checking dependencies...${NC}"
if command -v npx &> /dev/null; then
    echo -e "${GREEN}  ✓ npx is available${NC}"
else
    echo -e "${YELLOW}  ⚠ Node.js/npm not found. Install from https://nodejs.org/${NC}"
fi

echo ""
echo -e "${GREEN}╔═══════════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║              Installation Complete! 🎉                     ║${NC}"
echo -e "${GREEN}╚═══════════════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "Available slash commands in Antigravity:"
echo ""
echo -e "  ${BLUE}/docs${NC}       - View documentation standards"
echo -e "  ${BLUE}/docs-init${NC}  - Initialize docs folder structure"
echo -e "  ${BLUE}/docs-lint${NC}  - Lint markdown files"
echo -e "  ${BLUE}/docs-audit${NC} - Audit documentation completeness"
echo ""
echo -e "Get started by typing ${YELLOW}/docs${NC} in Antigravity!"
echo ""
