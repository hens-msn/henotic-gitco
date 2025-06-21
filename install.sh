#!/bin/bash
# ============================================
# 🚀 Henotic Gitco Installer Script
# One-liner installation for Henotic Gitco
# Usage: curl -sSL https://raw.githubusercontent.com/hens-msn/henotic-gitco/main/install.sh | bash
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

echo -e "${CYAN}🚀 Installing Henotic Gitco...${NC}"
echo -e "${PURPLE}==============================${NC}"
echo -e "${YELLOW}Git commit yang gampang, cepet, dan stylish!${NC}"
echo ""

# Detect shell
if [[ $SHELL == *"zsh"* ]]; then
    SHELL_CONFIG="$HOME/.zshrc"
    echo -e "${BLUE}📍 Detected: Zsh shell${NC}"
elif [[ $SHELL == *"bash"* ]]; then
    SHELL_CONFIG="$HOME/.bashrc"
    echo -e "${BLUE}📍 Detected: Bash shell${NC}"
else
    echo -e "${YELLOW}⚠️  Unknown shell, defaulting to .bashrc${NC}"
    SHELL_CONFIG="$HOME/.bashrc"
fi

# Check if gitco already exists
if command -v gitco &> /dev/null; then
    echo -e "${YELLOW}⚠️  Henotic Gitco already installed!${NC}"
    read -p "Do you want to reinstall/update? (y/N): " confirm
    if [[ ! $confirm == [yY] ]]; then
        echo -e "${BLUE}👍 Installation cancelled.${NC}"
        exit 0
    fi
    
    # Remove old gitco function
    echo -e "${YELLOW}🔄 Removing old Henotic Gitco...${NC}"
    sed -i '/# Henotic Gitco - Ultimate Git Commit Script/,/complete -F _gitco_completion gitco/d' "$SHELL_CONFIG"
fi

# Check git installation
if ! command -v git &> /dev/null; then
    echo -e "${RED}❌ Git is not installed! Please install Git first.${NC}"
    exit 1
fi

# Download and install Henotic Gitco script
echo -e "${CYAN}⬇️  Downloading Henotic Gitco script...${NC}"

# Download the main script from GitHub
if command -v curl &> /dev/null; then
    GITCO_SCRIPT=$(curl -sSL https://raw.githubusercontent.com/hens-msn/henotic-gitco/main/gitco.sh)
elif command -v wget &> /dev/null; then
    GITCO_SCRIPT=$(wget -qO- https://raw.githubusercontent.com/hens-msn/henotic-gitco/main/gitco.sh)
else
    echo -e "${RED}❌ Neither curl nor wget found! Please install one of them.${NC}"
    exit 1
fi

# Check if download was successful
if [ -z "$GITCO_SCRIPT" ]; then
    echo -e "${RED}❌ Failed to download Henotic Gitco script!${NC}"
    echo -e "${YELLOW}💡 Please check your internet connection and try again.${NC}"
    exit 1
fi

# Add the script to shell configuration
echo "" >> "$SHELL_CONFIG"
echo "$GITCO_SCRIPT" >> "$SHELL_CONFIG"

echo -e "${GREEN}✅ Henotic Gitco installed to $SHELL_CONFIG${NC}"

# Reload shell configuration
echo -e "${CYAN}🔄 Reloading shell configuration...${NC}"
if [[ $SHELL == *"zsh"* ]]; then
    source ~/.zshrc 2>/dev/null || true
else
    source ~/.bashrc 2>/dev/null || true
fi

echo ""
echo -e "${GREEN}🎉 Henotic Gitco installation completed!${NC}"
echo -e "${PURPLE}============================================${NC}"
echo ""
echo -e "${YELLOW}📖 Try it out:${NC}"
echo -e "  ${CYAN}gitco --help${NC}                    # Show help"
echo -e "  ${CYAN}gitco feat 'add awesome feature'${NC}  # Normal commit"
echo -e "  ${CYAN}gitco quick 'minor updates'${NC}       # Quick commit (auto-detect)"
echo -e "  ${CYAN}gitco push ui 'update styles'${NC}     # Commit + push"
echo ""
echo -e "${BLUE}💡 Tips:${NC}"
echo -e "  • Use ${CYAN}gitco quick${NC} for automatic type detection"
echo -e "  • All commits use format: ${YELLOW}type: -message-${NC}"
echo -e "  • Tab completion is enabled for all commands"
echo ""
echo -e "${PURPLE}⭐ If this tool helps you, please star the repo:${NC}"
echo -e "${CYAN}   https://github.com/hens-msn/henotic-gitco${NC}"
echo ""
echo -e "${GREEN}Happy committing! 🚀${NC}"
echo -e "${YELLOW}Made with ❤️  by Henotic AI${NC}"