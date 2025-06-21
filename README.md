# 🚀 Henotic Gitco

**Git commit yang gampang, cepet, dan stylish!** ✨

Henotic Gitco adalah script bash ultimate yang bikin commit git jadi lebih mudah dengan conventional commits format. Gak perlu lagi mikir panjang-panjang, tinggal `gitco` dan selesai!

## 🎯 Features

- ✅ **Conventional Commits** - Format standar industri
- ✅ **Auto-Detection** - Deteksi otomatis commit type dari file yang diubah
- ✅ **Amend Support** - Edit commit terakhir dengan mudah
- ✅ **Push Integration** - Commit dan push sekaligus
- ✅ **Tab Completion** - Autocomplete command dan types
- ✅ **Colorful Output** - Terminal output yang eye-candy
- ✅ **Cross Platform** - Works di macOS, Linux, dan WSL

## ⚡ Quick Install

Jalanin command ini dan langsung jadi!

```bash
curl -sSL https://raw.githubusercontent.com/hens-msn/henotic-gitco/main/install.sh | bash
```

**Manual Install:**
```bash
git clone https://github.com/hens-msn/henotic-gitco.git
cd henotic-gitco
chmod +x install.sh
./install.sh
```

## 📖 Usage

### Basic Commands

```bash
# Normal commit
gitco feat "add dark mode toggle"
# Result: feat: -add dark mode toggle-

# Quick commit (auto-detect type)
gitco quick "update navbar styles"
# Result: style: -update navbar styles-

# Amend last commit
gitco amend fix "handle edge case properly"
# Result: fix: -handle edge case properly-

# Commit and push
gitco push ui "improve button animations"
# Result: ui: -improve button animations- + push to current branch
```

### Commit Types

| Type | Emoji | Description |
|------|-------|-------------|
| `feat` | ✨ | New feature atau fitur baru |
| `fix` | 🐛 | Bug fixes |
| `docs` | 📚 | Documentation changes |
| `style` | 💄 | Code style changes (formatting, etc) |
| `refactor` | ♻️ | Code refactoring |
| `test` | 🧪 | Adding or updating tests |
| `chore` | 🔧 | Maintenance tasks |
| `ui` | 🎨 | UI/UX improvements |
| `api` | 🔌 | API related changes |
| `mobile` | 📱 | Mobile specific changes |
| `web` | 🌐 | Web specific changes |
| `perf` | ⚡ | Performance improvements |
| `security` | 🔒 | Security improvements |
| `config` | ⚙️ | Configuration changes |
| `deploy` | 🚀 | Deployment related |
| `hotfix` | 🚨 | Critical hotfix |
| `wip` | 🚧 | Work in progress |

### Auto-Detection Magic 🤖

Command `gitco quick` akan otomatis detect commit type berdasarkan file yang kamu ubah:

- **📚 docs** → `.md`, `README`, `CHANGELOG`, `docs/`
- **💄 style** → `.css`, `.scss`, `.sass`, files dengan kata "style"
- **🧪 test** → files dengan kata `test`, `spec`, `__tests__`
- **⚙️ config** → `package.json`, `bun.lockb`, `.env`
- **🎨 ui** → `component`, `.jsx`, `.tsx`, `.vue`, `ui/`, `components/`
- **🔌 api** → `api/`, `route`, `controller`, `service`
- **📱 mobile** → kata "mobile", "react-native", `.ios.`, `.android.`
- **🔧 chore** → default fallback untuk yang lain

## 💡 Examples

```bash
# Scenario: Kamu edit file Button.tsx di folder components/
gitco quick "add loading state"
# Output: ui: -add loading state-

# Scenario: Kamu edit README.md
gitco quick "update installation guide"  
# Output: docs: -update installation guide-

# Scenario: Kamu edit style.css
gitco quick "fix navbar responsive"
# Output: style: -fix navbar responsive-

# Scenario: Kamu mau commit dan push sekaligus
gitco push feat "implement user authentication"
# Output: feat: -implement user authentication- + push ke branch saat ini
```

## 🛠️ Commands Reference

### Help
```bash
gitco --help    # atau gitco -h atau gitco help
```

### Normal Commit
```bash
gitco <type> "<message>"
gitco feat "add shopping cart"
gitco fix "resolve login issue"
```

### Quick Commit (Auto-detect)
```bash
gitco quick "<message>"
gitco quick "minor bug fixes"
```

### Amend Last Commit
```bash
gitco amend <type> "<new message>"
gitco amend feat "add shopping cart with validation"
```

### Commit + Push
```bash
gitco push <type> "<message>"
gitco push deploy "update production config"
```

## 🎨 Output Examples

```bash
$ gitco feat "add user dashboard"
✅ Committed! a1b2c3d feat: -add user dashboard-

$ gitco quick "update styles"
🤖 Auto-detected type: style
✅ Quick commit done! e4f5g6h style: -update styles-

$ gitco push fix "handle null values"
🚀 Pushing to feature/user-auth...
✅ Pushed! i7j8k9l fix: -handle null values-
```

## 🔄 Uninstall

Kalau mau uninstall (kenapa sih? 😢):

```bash
curl -sSL https://raw.githubusercontent.com/hens-msn/henotic-gitco/main/uninstall.sh | bash
```

**Safe & Clean Removal:**
- ✅ Only removes gitco-related configurations
- ✅ Verification to ensure complete removal  
- ✅ No backup files needed (surgical precision)
- ✅ Works even with leftover configurations

## 🤝 Contributing

Issues dan PRs are welcome! Kalau ada ide fitur baru atau nemu bug, silakan buat issue atau langsung PR.

**Development:**
```bash
git clone https://github.com/hens-msn/henotic-gitco.git
cd henotic-gitco
# Edit gitco.sh
# Test locally
./gitco.sh feat "your changes"
```

## 📝 Changelog

### v2.1.0 - Clean Edition
- ✅ Simplified commands (removed advanced features)
- ✅ Better auto-detection logic
- ✅ Improved error handling
- ✅ Cleaner output messages

### v2.0.0 - Ultimate Edition  
- ✅ Added auto-detection for `gitco quick`
- ✅ Added `amend` and `push` commands
- ✅ Enhanced help system
- ✅ Colorful terminal output

### v1.0.0 - Initial Release
- ✅ Basic conventional commits
- ✅ Tab completion

## 📄 License

MIT License - Feel free to use, modify, and distribute!

## 🙏 Credits

Made with ❤️ by [Henotic AI](https://github.com/hens-msn) - Script Andalan Sejuta Umat!

**Inspired by:** Conventional Commits, developer productivity, dan keinginan buat bikin hidup lebih gampang! 🚀

---

⭐ **Kalau script ini berguna, jangan lupa kasih star ya!** ⭐

**Follow untuk updates:** [@hens-msn](https://github.com/hens-msn)