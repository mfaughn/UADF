#!/bin/bash

# UADF Installation Script
# Installs the Universal Agentic Development Framework for Claude Code

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "=========================================="
echo "  UADF - Universal Agentic Development Framework"
echo "  Installation Script"
echo "=========================================="
echo ""

# Determine script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Target directories
CLAUDE_DIR="$HOME/.claude"
UADF_DIR="$CLAUDE_DIR/uadf"
TEMPLATES_DIR="$UADF_DIR/templates"
COMMANDS_DIR="$CLAUDE_DIR/commands"

# Check if Claude Code directory exists
if [ ! -d "$CLAUDE_DIR" ]; then
    echo -e "${YELLOW}Creating ~/.claude directory...${NC}"
    mkdir -p "$CLAUDE_DIR"
fi

# Check for existing UADF installation
if [ -d "$UADF_DIR" ]; then
    echo -e "${YELLOW}Warning: Existing UADF installation found at $UADF_DIR${NC}"
    read -p "Do you want to back it up and continue? (y/n) " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        BACKUP_DIR="$UADF_DIR.backup.$(date +%Y%m%d%H%M%S)"
        echo "Backing up to $BACKUP_DIR"
        mv "$UADF_DIR" "$BACKUP_DIR"
    else
        echo "Installation cancelled."
        exit 1
    fi
fi

# Check for existing commands that might conflict
EXISTING_COMMANDS=()
for cmd in uadf-init uadf-start uadf-task uadf-handoff uadf-adr uadf-team-on uadf-team-off uadf-help; do
    if [ -f "$COMMANDS_DIR/$cmd.md" ]; then
        EXISTING_COMMANDS+=("$cmd.md")
    fi
done

if [ ${#EXISTING_COMMANDS[@]} -gt 0 ]; then
    echo -e "${YELLOW}Warning: Existing UADF commands found:${NC}"
    printf '  %s\n' "${EXISTING_COMMANDS[@]}"
    read -p "Overwrite these commands? (y/n) " -n 1 -r
    echo ""
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Installation cancelled."
        exit 1
    fi
fi

# Create directories
echo "Creating directories..."
mkdir -p "$UADF_DIR"
mkdir -p "$TEMPLATES_DIR"
mkdir -p "$COMMANDS_DIR"

# Copy files
echo "Copying framework and templates..."
cp "$SCRIPT_DIR/docs/framework.md" "$UADF_DIR/"
cp "$SCRIPT_DIR/docs/usage.md" "$UADF_DIR/README.md"
cp "$SCRIPT_DIR/templates/"*.md "$TEMPLATES_DIR/"

echo "Installing commands..."
cp "$SCRIPT_DIR/commands/"*.md "$COMMANDS_DIR/"

# Handle CLAUDE.md
CLAUDE_MD="$CLAUDE_DIR/CLAUDE.md"
SNIPPET_FILE="$SCRIPT_DIR/claude-md-snippet.md"

if [ -f "$CLAUDE_MD" ]; then
    # Check if UADF section already exists
    if grep -q "## UADF" "$CLAUDE_MD"; then
        echo -e "${YELLOW}UADF section already exists in $CLAUDE_MD${NC}"
        echo "Skipping CLAUDE.md update. You may want to manually update it."
    else
        echo ""
        read -p "Add UADF section to your global CLAUDE.md? (y/n) " -n 1 -r
        echo ""
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            echo "" >> "$CLAUDE_MD"
            cat "$SNIPPET_FILE" >> "$CLAUDE_MD"
            echo -e "${GREEN}Added UADF section to $CLAUDE_MD${NC}"
        else
            echo "Skipped. You can manually add the contents of claude-md-snippet.md later."
        fi
    fi
else
    echo "Creating $CLAUDE_MD with UADF section..."
    cp "$SNIPPET_FILE" "$CLAUDE_MD"
fi

# Success message
echo ""
echo -e "${GREEN}=========================================="
echo "  UADF installed successfully!"
echo "==========================================${NC}"
echo ""
echo "Installed to:"
echo "  - Framework: $UADF_DIR/"
echo "  - Templates: $TEMPLATES_DIR/"
echo "  - Commands:  $COMMANDS_DIR/"
echo ""
echo "Quick start:"
echo "  1. Open Claude Code in a new project directory"
echo "  2. Run: /uadf-init my-project-name"
echo "  3. Follow the interview prompts"
echo ""
echo "For help: /uadf-help"
echo ""
