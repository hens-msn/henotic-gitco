# Changelog

All notable changes to Henotic Gitco will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [2.1.0] - 2025-06-21

### Added
- 🚀 Initial release of Henotic Gitco
- ✨ Conventional commits support with 16 different types
- 🤖 Auto-detection feature for `gitco quick` command
- 🔧 Amend last commit functionality
- 📤 Commit and push in one command
- 🎨 Colorful terminal output
- 📋 Tab completion for commands and types
- 🛡️ Git repository validation
- 📖 Comprehensive help system

### Features
- **Normal Commit**: `gitco <type> <message>`
- **Quick Commit**: `gitco quick <message>` (auto-detects type from files)
- **Amend Commit**: `gitco amend <type> <message>`
- **Push Commit**: `gitco push <type> <message>`

### Commit Types Supported
- `feat` - New features
- `fix` - Bug fixes  
- `docs` - Documentation changes
- `style` - Code style changes
- `refactor` - Code refactoring
- `test` - Adding or updating tests
- `chore` - Maintenance tasks
- `ui` - UI/UX improvements
- `api` - API related changes
- `mobile` - Mobile specific changes
- `web` - Web specific changes
- `perf` - Performance improvements
- `security` - Security improvements
- `config` - Configuration changes
- `deploy` - Deployment related
- `hotfix` - Critical hotfixes
- `wip` - Work in progress

### Auto-Detection Logic
- 📚 `docs` - `.md`, `README`, `CHANGELOG`, `docs/` files
- 💄 `style` - `.css`, `.scss`, `.sass`, files with "style"
- 🧪 `test` - `test`, `spec`, `__tests__` files
- ⚙️ `config` - `package.json`, `bun.lockb`, `.env` files
- 🎨 `ui` - `component`, `.jsx`, `.tsx`, `.vue`, `ui/`, `components/` files
- 🔌 `api` - `api/`, `route`, `controller`, `service` files
- 📱 `mobile` - "mobile", "react-native", `.ios.`, `.android.` files
- 🔧 `chore` - Default fallback for other files

### Installation
- 📦 One-liner installer script
- 🔧 Cross-platform support (macOS, Linux, WSL)
- 🐚 Auto-detection of shell (bash/zsh)
- 🔄 Update existing installation support
- 🗑️ Clean uninstaller with surgical precision (no backup needed)
- 🔍 Verification script to ensure complete removal

### Developer Experience
- 🎯 Error handling and validation
- 💡 Helpful error messages
- 🎨 Emoji-rich output
- 📖 Comprehensive documentation
- 🚀 Fast and lightweight

## [2.0.0] - Development

### Added
- Ultimate edition with advanced features
- Enhanced auto-detection
- Multiple command support

### Removed
- Advanced commands (simplified in v2.1.0)
- Extra aliases (kept clean in v2.1.0)

## [1.0.0] - Initial Development

### Added
- Basic conventional commits
- Simple gitco function
- Basic tab completion