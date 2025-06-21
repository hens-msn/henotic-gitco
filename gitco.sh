# ============================================
# 🚀 Henotic Gitco - Ultimate Git Commit Script
# Git commit yang gampang, cepet, dan stylish!
# Usage: gitco <command> [options] <message>
# Author: Henotic AI 🤖
# Version: 2.1.0 - Clean Edition
# Repository: https://github.com/hens-msn/henotic-gitco
# ============================================

gitco() {
    # Colors untuk output yang keren
    local RED='\033[0;31m'
    local GREEN='\033[0;32m'
    local YELLOW='\033[1;33m'
    local BLUE='\033[0;34m'
    local PURPLE='\033[0;35m'
    local CYAN='\033[0;36m'
    local NC='\033[0m' # No Color
    
    # Help yang lengkap tapi gak ribet
    if [[ "$1" == "--help" || "$1" == "-h" || "$1" == "help" ]]; then
        echo -e "${CYAN}🚀 Henotic Gitco - Ultimate Git Commit Script${NC}"
        echo -e "${PURPLE}===============================================${NC}"
        echo -e "${YELLOW}Git commit yang gampang, cepet, dan stylish!${NC}"
        echo ""
        echo -e "${YELLOW}📖 Basic Usage:${NC}"
        echo -e "  ${GREEN}gitco <type> <message>${NC}           # Normal commit"
        echo -e "  ${GREEN}gitco amend <type> <message>${NC}     # Amend last commit"
        echo -e "  ${GREEN}gitco push <type> <message>${NC}      # Commit + push sekaligus"
        echo -e "  ${GREEN}gitco quick <message>${NC}            # Quick commit (auto-detect type)"
        echo ""
        echo -e "${YELLOW}🎯 Commit Types:${NC}"
        echo -e "  ${BLUE}feat${NC}      ✨ New feature atau fitur baru"
        echo -e "  ${BLUE}fix${NC}       🐛 Bug fixes"
        echo -e "  ${BLUE}docs${NC}      📚 Documentation changes"
        echo -e "  ${BLUE}style${NC}     💄 Code style changes (formatting, etc)"
        echo -e "  ${BLUE}refactor${NC}  ♻️  Code refactoring"
        echo -e "  ${BLUE}test${NC}      🧪 Adding or updating tests"
        echo -e "  ${BLUE}chore${NC}     🔧 Maintenance tasks"
        echo -e "  ${BLUE}ui${NC}        🎨 UI/UX improvements"
        echo -e "  ${BLUE}api${NC}       🔌 API related changes"
        echo -e "  ${BLUE}mobile${NC}    📱 Mobile specific changes"
        echo -e "  ${BLUE}web${NC}       🌐 Web specific changes"
        echo -e "  ${BLUE}perf${NC}      ⚡ Performance improvements"
        echo -e "  ${BLUE}security${NC}  🔒 Security improvements"
        echo -e "  ${BLUE}config${NC}    ⚙️  Configuration changes"
        echo -e "  ${BLUE}deploy${NC}    🚀 Deployment related"
        echo -e "  ${BLUE}hotfix${NC}    🚨 Critical hotfix"
        echo -e "  ${BLUE}wip${NC}       🚧 Work in progress"
        echo ""
        echo -e "${YELLOW}💡 Examples:${NC}"
        echo -e "  ${CYAN}gitco feat 'add dark mode'${NC}        # Result: feat: -add dark mode-"
        echo -e "  ${CYAN}gitco amend fix 'handle null values'${NC} # Result: fix: -handle null values-"
        echo -e "  ${CYAN}gitco push ui 'update button styles'${NC} # Result: ui: -update button styles-"
        echo -e "  ${CYAN}gitco quick 'minor updates'${NC}       # Auto-detect type dari file"
        echo ""
        echo -e "${PURPLE}Repository: ${CYAN}https://github.com/hens-msn/henotic-gitco${NC}"
        echo -e "${PURPLE}Made with ❤️  by Henotic AI - Script Andalan Sejuta Umat!${NC}"
        return 0
    fi
    
    # No arguments
    if [ $# -eq 0 ]; then
        echo -e "${RED}❌ Eh, mana argumentnya?${NC}"
        echo -e "${YELLOW}💡 Run 'gitco --help' untuk panduan lengkap${NC}"
        return 1
    fi
    
    # Check if we're in a git repository
    if ! git rev-parse --git-dir > /dev/null 2>&1; then
        echo -e "${RED}❌ Not a git repository!${NC}"
        echo -e "${YELLOW}💡 Run 'git init' to initialize a git repository${NC}"
        return 1
    fi
    
    local command=$1
    shift
    
    case $command in
        # Quick commit (auto-detect type berdasarkan file yang diubah)
        "quick")
            if [ $# -eq 0 ]; then
                echo -e "${RED}❌ Message required for quick commit!${NC}"
                return 1
            fi
            
            local message="$*"
            local auto_type="chore"  # default fallback
            
            # Auto-detect berdasarkan file yang diubah
            local changed_files=$(git diff --cached --name-only 2>/dev/null || git diff --name-only)
            
            if echo "$changed_files" | grep -q "\.md$\|README\|CHANGELOG\|docs/"; then
                auto_type="docs"
            elif echo "$changed_files" | grep -q "\.css$\|\.scss$\|\.less$\|\.sass$\|style"; then
                auto_type="style"
            elif echo "$changed_files" | grep -q "test\|spec\|\.test\.\|\.spec\.\|__tests__"; then
                auto_type="test"
            elif echo "$changed_files" | grep -q "package\.json\|yarn\.lock\|bun\.lockb\|\.env"; then
                auto_type="config"
            elif echo "$changed_files" | grep -q "component\|\.jsx$\|\.tsx$\|\.vue$\|ui/\|components/"; then
                auto_type="ui"
            elif echo "$changed_files" | grep -q "api/\|route\|controller\|service"; then
                auto_type="api"
            elif echo "$changed_files" | grep -q "mobile\|react-native\|\.ios\.\|\.android\."; then
                auto_type="mobile"
            fi
            
            echo -e "${YELLOW}🤖 Auto-detected type: ${BLUE}$auto_type${NC}"
            git add .
            git commit -m "$auto_type: -$message-"
            echo -e "${GREEN}✅ Quick commit done! $(git log --oneline -1)${NC}"
            ;;
        
        # Amend commit
        "amend")
            if [ $# -lt 2 ]; then
                echo -e "${RED}❌ Usage: gitco amend <type> <message>${NC}"
                return 1
            fi
            
            local type=$1
            shift
            local message="$*"
            
            # Validate type
            local valid_types=("feat" "fix" "docs" "style" "refactor" "test" "chore" "ui" "api" "mobile" "web" "perf" "security" "config" "deploy" "hotfix" "wip")
            if [[ ! " ${valid_types[@]} " =~ " $type " ]]; then
                echo -e "${RED}❌ Invalid type: $type${NC}"
                echo -e "${YELLOW}💡 Valid types: ${valid_types[*]}${NC}"
                return 1
            fi
            
            git add .
            git commit --amend -m "$type: -$message-"
            echo -e "${GREEN}✅ Amended! $(git log --oneline -1)${NC}"
            ;;
        
        # Commit and push
        "push")
            if [ $# -lt 2 ]; then
                echo -e "${RED}❌ Usage: gitco push <type> <message>${NC}"
                return 1
            fi
            
            local type=$1
            shift
            local message="$*"
            
            # Validate type
            local valid_types=("feat" "fix" "docs" "style" "refactor" "test" "chore" "ui" "api" "mobile" "web" "perf" "security" "config" "deploy" "hotfix" "wip")
            if [[ ! " ${valid_types[@]} " =~ " $type " ]]; then
                echo -e "${RED}❌ Invalid type: $type${NC}"
                echo -e "${YELLOW}💡 Valid types: ${valid_types[*]}${NC}"
                return 1
            fi
            
            local current_branch=$(git branch --show-current)
            
            git add .
            git commit -m "$type: -$message-"
            echo -e "${CYAN}🚀 Pushing to $current_branch...${NC}"
            git push origin $current_branch
            echo -e "${GREEN}✅ Pushed! $(git log --oneline -1)${NC}"
            ;;
        
        # Normal commit (default)
        *)
            local type=$command
            local message="$*"
            
            if [ -z "$message" ]; then
                echo -e "${RED}❌ Message required!${NC}"
                echo -e "${YELLOW}💡 Usage: gitco <type> <message>${NC}"
                return 1
            fi
            
            # Validate type
            local valid_types=("feat" "fix" "docs" "style" "refactor" "test" "chore" "ui" "api" "mobile" "web" "perf" "security" "config" "deploy" "hotfix" "wip")
            if [[ ! " ${valid_types[@]} " =~ " $type " ]]; then
                echo -e "${RED}❌ Invalid type: $type${NC}"
                echo -e "${YELLOW}💡 Valid types: ${valid_types[*]}${NC}"
                echo -e "${CYAN}💡 Or use 'gitco quick \"$type $message\"' for auto-detection${NC}"
                return 1
            fi
            
            git add .
            git commit -m "$type: -$message-"
            echo -e "${GREEN}✅ Committed! $(git log --oneline -1)${NC}"
            ;;
    esac
}

# Autocomplete
_gitco_completion() {
    local cur prev
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    
    # Commands dan types
    local commands="amend push quick --help help"
    local types="feat fix docs style refactor test chore ui api mobile web perf security config deploy hotfix wip"
    
    if [ $COMP_CWORD -eq 1 ]; then
        # First argument: command atau type
        COMPREPLY=($(compgen -W "$commands $types" -- "$cur"))
    elif [ $COMP_CWORD -eq 2 ]; then
        # Second argument depends on first
        case "$prev" in
            "amend"|"push")
                COMPREPLY=($(compgen -W "$types" -- "$cur"))
                ;;
        esac
    fi
    
    return 0
}

# Register completion
complete -F _gitco_completion gitco