#!/bin/bash
# ============================================
# 🗑️ Henotic Gitco Uninstaller Script
# Clean removal for Henotic Gitco
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

echo -e "${CYAN}🗑️ Uninstalling Henotic Gitco...${NC}"
echo -e "${PURPLE}================================${NC}"
echo -e "${YELLOW}Kenapa sih mau uninstall? 😢${NC}"
echo ""

# Detect shell
if [[ $SHELL == *"zsh"* ]]; then
    SHELL_CONFIG="$HOME/.zshrc"
    echo -e "${BLUE}📍 Detected: Zsh shell${NC}"
elif [[ $SHELL == *"bash"* ]]; then
    SHELL_CONFIG="$HOME/.bashrc"
    echo -e "${BLUE}📍 Detected: Bash shell${NC}"
else
    echo -e "${YELLOW}⚠️  Unknown shell, checking both .bashrc and .zshrc${NC}"
    SHELL_CONFIG="$HOME/.bashrc"
fi

# Check if Henotic Gitco is installed
GITCO_FOUND=false

if [[ -f "$SHELL_CONFIG" ]] && grep -q "Henotic Gitco" "$SHELL_CONFIG"; then
    GITCO_FOUND=true
fi

# Also check .zshrc if we're on unknown shell
if [[ $SHELL != *"zsh"* ]] && [[ -f "$HOME/.zshrc" ]] && grep -q "Henotic Gitco" "$HOME/.zshrc"; then
    GITCO_FOUND=true
    SHELL_CONFIG="$HOME/.zshrc"
fi

if [[ "$GITCO_FOUND" == "false" ]]; then
    # Check if gitco command exists anyway
    if command -v gitco &> /dev/null; then
        echo -e "${YELLOW}⚠️  Gitco command found but installation not detected in shell config${NC}"
        echo -e "${BLUE}💡 You might need to manually remove gitco if it's installed elsewhere${NC}"
    else
        echo -e "${GREEN}✅ Henotic Gitco is not installed or already removed!${NC}"
        echo -e "${BLUE}👍 Nothing to do here.${NC}"
        exit 0
    fi
else
    echo -e "${YELLOW}🔍 Found Henotic Gitco installation in: $SHELL_CONFIG${NC}"
fi

# Confirmation
echo ""
read -p "Are you sure you want to uninstall Henotic Gitco? (y/N): " confirm
if [[ ! $confirm == [yY] ]]; then
    echo -e "${BLUE}👍 Uninstall cancelled. Gitco stays! 🎉${NC}"
    exit 0
fi

echo ""
echo -e "${CYAN}🧹 Removing Henotic Gitco from shell configuration...${NC}"

# Remove from shell config with surgical precision
if [[ -f "$SHELL_CONFIG" ]]; then
    # Create a backup of current config (temporary)
    cp "$SHELL_CONFIG" "${SHELL_CONFIG}.gitco_backup"
    
    # Remove Henotic Gitco block (from marker to completion)
    sed -i.bak '/# ============================================/,/complete -F _gitco_completion gitco/d' "$SHELL_CONFIG"
    
    # Also remove any standalone gitco function (fallback)
    sed -i.bak '/^gitco()/,/^}/d' "$SHELL_CONFIG"
    sed -i.bak '/^_gitco_completion()/,/^}/d' "$SHELL_CONFIG"
    sed -i.bak '/complete -F _gitco_completion gitco/d' "$SHELL_CONFIG"
    
    # Remove empty lines that might be left
    sed -i.bak '/^$/N;/^\n$/d' "$SHELL_CONFIG"
    
    # Clean up sed backup files
    rm -f "${SHELL_CONFIG}.bak"
    
    echo -e "${GREEN}✅ Removed from $SHELL_CONFIG${NC}"
else
    echo -e "${YELLOW}⚠️  Shell config file not found: $SHELL_CONFIG${NC}"
fi

# Also check and clean other common shell configs
for config_file in "$HOME/.bash_profile" "$HOME/.profile"; do
    if [[ -f "$config_file" ]] && grep -q "Henotic Gitco" "$config_file"; then
        echo -e "${CYAN}🧹 Found and cleaning $config_file...${NC}"
        sed -i.bak '/# ============================================/,/complete -F _gitco_completion gitco/d' "$config_file"
        sed -i.bak '/^gitco()/,/^}/d' "$config_file"
        sed -i.bak '/^_gitco_completion()/,/^}/d' "$config_file"
        sed -i.bak '/complete -F _gitco_completion gitco/d' "$config_file"
        rm -f "${config_file}.bak"
        echo -e "${GREEN}✅ Cleaned $config_file${NC}"
    fi
done

# Reload shell configuration to remove gitco from current session
echo -e "${CYAN}🔄 Reloading shell configuration...${NC}"
if [[ $SHELL == *"zsh"* ]]; then
    source ~/.zshrc 2>/dev/null || true
else
    source ~/.bashrc 2>/dev/null || true
fi

# Verification
echo ""
echo -e "${CYAN}🔍 Verifying removal...${NC}"

VERIFICATION_PASSED=true

# Check if gitco command still exists
if command -v gitco &> /dev/null; then
    echo -e "${YELLOW}⚠️  gitco command still available (might need to restart terminal)${NC}"
    VERIFICATION_PASSED=false
else
    echo -e "${GREEN}✅ gitco command removed${NC}"
fi

# Check shell config files
for config_file in "$HOME/.bashrc" "$HOME/.zshrc" "$HOME/.bash_profile" "$HOME/.profile"; do
    if [[ -f "$config_file" ]] && grep -q "gitco\|Henotic Gitco" "$config_file"; then
        echo -e "${YELLOW}⚠️  Found gitco references in $config_file${NC}"
        VERIFICATION_PASSED=false
    fi
done

if [[ "$VERIFICATION_PASSED" == "true" ]]; then
    echo -e "${GREEN}✅ All gitco references removed${NC}"
fi

# Clean up backup file
if [[ -f "${SHELL_CONFIG}.gitco_backup" ]]; then
    rm -f "${SHELL_CONFIG}.gitco_backup"
fi

echo ""
if [[ "$VERIFICATION_PASSED" == "true" ]]; then
    echo -e "${GREEN}🎉 Henotic Gitco successfully uninstalled!${NC}"
else
    echo -e "${YELLOW}⚠️  Uninstall completed with warnings${NC}"
    echo -e "${BLUE}💡 You might need to restart your terminal or manually remove remaining references${NC}"
fi

echo -e "${PURPLE}=====================================${NC}"
echo ""
echo -e "${CYAN}💔 We're sad to see you go...${NC}"
echo -e "${YELLOW}🤔 If you had issues, please report them at:${NC}"
echo -e "${BLUE}   https://github.com/hens-msn/henotic-gitco/issues${NC}"
echo ""
echo -e "${PURPLE}✨ Thanks for using Henotic Gitco!${NC}"
echo -e "${YELLOW}Made with ❤️  by Henotic AI - Script Andalan Sejuta Umat!${NC}"
echo ""
echo -e "${GREEN}👋 Bye bye! Comeback anytime! 🚀${NC}" 