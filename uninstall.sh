#!/bin/bash
# ============================================
# 🗑️ Henotic Gitco Uninstaller Script
# Remove Henotic Gitco from your system
# Usage: curl -sSL https://raw.githubusercontent.com/hens-msn/henotic-gitco/main/uninstall.sh | bash
# Author: Henotic AI
# ============================================

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${YELLOW}🗑️  Henotic Gitco Uninstaller${NC}"
echo -e "${PURPLE}==============================${NC}"
echo ""

# Check if gitco exists
if ! command -v gitco &> /dev/null; then
    echo -e "${BLUE}ℹ️  Henotic Gitco is not installed on this system.${NC}"
    echo -e "${YELLOW}🔍 Checking for leftover configurations...${NC}"
    
    # Still check for leftover configs
    FOUND_LEFTOVER=false
    for config in "$HOME/.bashrc" "$HOME/.zshrc"; do
        if [[ -f "$config" ]] && grep -q "gitco" "$config"; then
            echo -e "${YELLOW}⚠️  Found gitco references in $config${NC}"
            FOUND_LEFTOVER=true
        fi
    done
    
    if [[ $FOUND_LEFTOVER == false ]]; then
        echo -e "${GREEN}✅ No leftover configurations found.${NC}"
        exit 0
    fi
    
    echo -e "${CYAN}🧹 Cleaning leftover configurations...${NC}"
fi

# Confirm uninstallation
echo -e "${RED}⚠️  This will remove Henotic Gitco from your system.${NC}"
echo -e "${YELLOW}Are you sure you want to uninstall Henotic Gitco?${NC}"
read -p "Type 'yes' to confirm: " confirm

if [[ $confirm != "yes" ]]; then
    echo -e "${BLUE}👍 Uninstallation cancelled. Henotic Gitco is still available!${NC}"
    exit 0
fi

# Detect shell
if [[ $SHELL == *"zsh"* ]]; then
    SHELL_CONFIG="$HOME/.zshrc"
    echo -e "${BLUE}📍 Detected: Zsh shell${NC}"
elif [[ $SHELL == *"bash"* ]]; then
    SHELL_CONFIG="$HOME/.bashrc"
    echo -e "${BLUE}📍 Detected: Bash shell${NC}"
else
    echo -e "${YELLOW}⚠️  Unknown shell, trying both .bashrc and .zshrc${NC}"
    SHELL_CONFIG="$HOME/.bashrc"
fi

echo -e "${CYAN}🔄 Removing Henotic Gitco...${NC}"

# Function to remove gitco from a config file
remove_gitco() {
    local config_file=$1
    
    if [ -f "$config_file" ]; then
        # More comprehensive removal patterns
        # Remove main Henotic Gitco block
        sed -i '/# Henotic Gitco - Ultimate Git Commit Script/,/complete -F _gitco_completion gitco/d' "$config_file"
        
        # Remove any old versions with different headers
        sed -i '/# Ultimate Git Commit Script/,/complete -F _gitco_completion gitco/d' "$config_file"
        sed -i '/# gitco function/,/complete -F _gitco_completion gitco/d' "$config_file"
        
        # Remove any standalone gitco function
        sed -i '/^gitco()/,/^}/d' "$config_file"
        
        # Remove completion function if exists separately
        sed -i '/^_gitco_completion()/,/^}/d' "$config_file"
        sed -i '/^complete -F _gitco_completion gitco/d' "$config_file"
        
        # Remove any gitco aliases
        sed -i '/alias.*gitco/d' "$config_file"
        
        # Verify removal
        if grep -q "gitco" "$config_file"; then
            echo -e "${YELLOW}⚠️  Some gitco references may still exist in $config_file${NC}"
            echo -e "${BLUE}🔍 Remaining references:${NC}"
            grep -n "gitco" "$config_file" | head -5
        else
            echo -e "${GREEN}✅ Completely removed from $config_file${NC}"
        fi
    fi
}

# Remove from detected shell config
remove_gitco "$SHELL_CONFIG"

# Also try to remove from other common shell configs
if [[ "$SHELL_CONFIG" != "$HOME/.bashrc" ]] && [[ -f "$HOME/.bashrc" ]]; then
    remove_gitco "$HOME/.bashrc"
fi

if [[ "$SHELL_CONFIG" != "$HOME/.zshrc" ]] && [[ -f "$HOME/.zshrc" ]]; then
    remove_gitco "$HOME/.zshrc"
fi

# Remove bash completion if exists
if [[ -f "$HOME/.bash_completion" ]]; then
    sed -i '/gitco/d' "$HOME/.bash_completion" 2>/dev/null
fi

echo ""
echo -e "${GREEN}🎉 Henotic Gitco has been successfully uninstalled!${NC}"
echo -e "${PURPLE}========================================${NC}"
echo ""
echo -e "${YELLOW}📝 What was removed:${NC}"
echo -e "  • gitco command and all its functions"
echo -e "  • Tab completion for gitco"
echo -e "  • All related aliases and configurations"
echo ""

# Quick verification
echo -e "${CYAN}🔍 Verifying removal...${NC}"
if command -v gitco &> /dev/null; then
    echo -e "${RED}⚠️  gitco command still exists! Manual cleanup may be needed.${NC}"
else
    echo -e "${GREEN}✅ gitco command successfully removed${NC}"
fi

# Check for any remaining references
REMAINING_REFS=false
for config in "$HOME/.bashrc" "$HOME/.zshrc"; do
    if [[ -f "$config" ]] && grep -q "gitco" "$config"; then
        if [[ $REMAINING_REFS == false ]]; then
            echo -e "${YELLOW}⚠️  Some gitco references may still exist:${NC}"
            REMAINING_REFS=true
        fi
        echo -e "${BLUE}   - $config${NC}"
    fi
done

if [[ $REMAINING_REFS == false ]]; then
    echo -e "${GREEN}✅ Configuration files clean${NC}"
fi

echo ""
echo -e "${YELLOW}🔄 To apply changes, please restart your terminal or run:${NC}"
if [[ $SHELL == *"zsh"* ]]; then
    echo -e "  ${CYAN}source ~/.zshrc${NC}"
else
    echo -e "  ${CYAN}source ~/.bashrc${NC}"
fi
echo ""
echo -e "${PURPLE}😢 Sorry to see you go!${NC}"
echo -e "${YELLOW}If you had any issues, please report them at:${NC}"
echo -e "${CYAN}https://github.com/hens-msn/henotic-gitco/issues${NC}"
echo ""
echo -e "${GREEN}You can always reinstall Henotic Gitco later with:${NC}"
echo -e "${CYAN}curl -sSL https://raw.githubusercontent.com/hens-msn/henotic-gitco/main/install.sh | bash${NC}"