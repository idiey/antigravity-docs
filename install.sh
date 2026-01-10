#!/bin/bash

# Antigravity Docs Installer
# Documentation Standards for Google Antigravity/Gemini Code
# Version: 1.3.0
# Usage: 
#   Global: curl -fsSL https://raw.githubusercontent.com/idiey/antigravity-docs/main/install.sh | bash
#   Project: curl -fsSL https://raw.githubusercontent.com/idiey/antigravity-docs/main/install.sh | bash -s -- --project
#   With Plan: curl -fsSL https://raw.githubusercontent.com/idiey/antigravity-docs/main/install.sh | bash -s -- --plan

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo "Installing Antigravity Documentation Standards"
echo "=================================================="
echo ""

# Parse arguments
INSTALL_TARGET="global"
INSTALL_PLAN=""
FORCE_INSTALL=""
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -p|--project) INSTALL_TARGET="project" ;;
        --plan) INSTALL_PLAN="true" ;;
        -u|--update) FORCE_INSTALL="true" ;;
        -f|--force) FORCE_INSTALL="true" ;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

# Detect installation method
if [ -d ".git" ] && [ -f "docs-guidelines.md" ]; then
    # Running from cloned repository
    INSTALL_MODE="local"
    REPO_DIR="$(pwd)"
    echo -e "${BLUE}Info: Installing from local repository${NC}"
else
    # Running from curl | bash
    INSTALL_MODE="remote"
    REPO_URL="https://raw.githubusercontent.com/idiey/antigravity-docs/main"
    echo -e "${BLUE}Info: Installing from remote repository${NC}"
fi

echo ""

if [ "$INSTALL_TARGET" = "project" ]; then
    echo -e "${BLUE}Info: Target: Project-level (.agent/workflows)${NC}"
    GEMINI_DIR="."
    WORKFLOWS_DIR=".agent/workflows"
else
    echo -e "${BLUE}Info: Target: Global (~/.gemini)${NC}"
    GEMINI_DIR="$HOME/.gemini"
    WORKFLOWS_DIR="$GEMINI_DIR/workflows"
fi

echo ""

# Create directories
if [ ! -d "$GEMINI_DIR" ]; then
    echo -e "${YELLOW}Creating $GEMINI_DIR directory...${NC}"
    mkdir -p "$GEMINI_DIR"
fi

if [ ! -d "$WORKFLOWS_DIR" ]; then
    echo -e "${YELLOW}Creating $WORKFLOWS_DIR directory...${NC}"
    mkdir -p "$WORKFLOWS_DIR"
fi

# Check if npm is installed
SKIP_LINTER=""
if ! command -v npm &> /dev/null; then
    echo -e "${YELLOW}Warning: npm not found. Skipping markdownlint installation.${NC}"
    echo -e "${YELLOW}   Install Node.js/npm to enable markdown linting.${NC}"
    SKIP_LINTER=true
fi

# Function to install file from local or remote
install_file() {
    local source_file=$1
    local dest_file=$2
    local file_desc=$3
    
    # Handle self-copy case (local install to current dir)
    if [ "$INSTALL_MODE" = "local" ] && [ "$REPO_DIR/$source_file" = "$(readlink -f "$dest_file")" ]; then
         # Skipping silent or verbose?
         # echo "Skipping self-copy of $source_file"
         return 0
    fi
    
    # Simple check for same file if readlink not available or complex
    if [ "$INSTALL_MODE" = "local" ] && [ "$GEMINI_DIR" = "." ]; then
        if [ "$source_file" = "${dest_file#./}" ] || [ "$source_file" = "$dest_file" ]; then
             return 0
        fi
    fi

    if [ -f "$dest_file" ]; then
        echo -e "${YELLOW}Warning: $file_desc already exists${NC}"
        # Only prompt if fully interactive terminal
        read -p "Overwrite? (y/N): " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            echo -e "${YELLOW}Skipping $file_desc${NC}"
            return 1
        fi
    fi

    if [ "$INSTALL_MODE" = "local" ]; then
        cp "$REPO_DIR/$source_file" "$dest_file"
    else
        curl -fsSL "$REPO_URL/$source_file" -o "$dest_file"
    fi

    if [ -f "$dest_file" ]; then
        echo -e "${GREEN}Success:${NC} $file_desc installed"
        return 0
    else
        echo -e "${RED}Error:${NC} Failed to install $file_desc"
        return 1
    fi
}

echo "Installing files..."
echo ""

# Install markdownlint-cli2 globally
if [ -z "$SKIP_LINTER" ]; then
    echo "Checking markdownlint-cli2..."
    if npm list -g markdownlint-cli2 &> /dev/null; then
        echo -e "${GREEN}Success:${NC} markdownlint-cli2 already installed"
    else
        echo "Installing markdownlint-cli2..."
        if npm install -g markdownlint-cli2 &> /dev/null; then
            echo -e "${GREEN}Success:${NC} markdownlint-cli2 installed"
        else
            echo -e "${YELLOW}Warning: Failed to install markdownlint-cli2${NC}"
            echo -e "${YELLOW}   You can install it manually: npm install -g markdownlint-cli2${NC}"
        fi
    fi
    echo ""
fi

# Install configuration files
install_file "docs-guidelines.md" "$GEMINI_DIR/docs-guidelines.md" "Documentation guidelines"
install_file ".markdownlint.json" "$GEMINI_DIR/.markdownlint.json" "Markdownlint configuration"

# Install workflow files
install_file "workflows/docs.md" "$WORKFLOWS_DIR/docs.md" "/docs command"
install_file "workflows/docs-init.md" "$WORKFLOWS_DIR/docs-init.md" "/docs-init command"
install_file "workflows/docs-lint.md" "$WORKFLOWS_DIR/docs-lint.md" "/docs-lint command"
install_file "workflows/docs-audit.md" "$WORKFLOWS_DIR/docs-audit.md" "/docs-audit command"
install_file "workflows/docs-update-toc.md" "$WORKFLOWS_DIR/docs-update-toc.md" "/docs-update-toc command"
install_file "workflows/docs-update.md" "$WORKFLOWS_DIR/docs-update.md" "/docs-update command"

# Install optional plan workflows
if [ -n "$INSTALL_PLAN" ]; then
    echo ""
    echo -e "${BLUE}Installing Plan workflows...${NC}"
    install_file "workflows/plan-init.md" "$WORKFLOWS_DIR/plan-init.md" "/plan-init command"
    install_file "workflows/plan-daily.md" "$WORKFLOWS_DIR/plan-daily.md" "/plan-daily command"
    install_file "workflows/plan-sprint.md" "$WORKFLOWS_DIR/plan-sprint.md" "/plan-sprint command"
    install_file "workflows/plan-checkpoint.md" "$WORKFLOWS_DIR/plan-checkpoint.md" "/plan-checkpoint command"
fi

echo ""
echo -e "${GREEN}Antigravity Documentation Standards installed successfully!${NC}"
echo ""
echo "Documentation Commands:"
echo "   /docs              - View documentation standards and templates"
echo "   /docs-init         - Initialize docs folder structure"
echo "   /docs-lint         - Lint and fix markdown files"
echo "   /docs-audit        - Audit documentation completeness"
echo "   /docs-update-toc   - Update Table of Contents"
echo "   /docs-update       - Update antigravity-docs to latest version"
if [ -n "$INSTALL_PLAN" ]; then
echo ""
echo "Planning Commands:"
echo "   /plan-init         - Initialize .plan folder structure"
echo "   /plan-daily        - Create/update daily achievement log"
echo "   /plan-sprint       - Manage sprint planning"
echo "   /plan-checkpoint   - Save/load work checkpoints"
else
echo ""
echo "Tip: Run with --plan flag to install planning workflows"
fi
echo ""
echo "Guidelines Location:"
echo "   $GEMINI_DIR/docs-guidelines.md"
echo ""
if [ -z "$SKIP_LINTER" ]; then
echo "Linting Commands:"
echo "   npx markdownlint-cli2 \"docs/**/*.md\"      - Lint all markdown files"
echo "   npx markdownlint-cli2 --fix \"docs/*.md\"   - Auto-fix markdown issues"
echo ""
fi
echo "Full README:"
if [ "$INSTALL_MODE" = "local" ]; then
echo "   cat $REPO_DIR/README.md"
else
echo "   https://github.com/idiey/antigravity-docs"
fi
echo ""
echo -e "${GREEN}You're all set! Try '/docs' in any project with Antigravity!${NC}"
echo ""
