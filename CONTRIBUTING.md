# Contributing to Henotic Gitco 🤝

Terima kasih udah tertarik untuk contribute ke Henotic Gitco! 🚀 

## 📋 How to Contribute

### 🐛 Bug Reports
Kalau kamu nemu bug:
1. Cek dulu di [Issues](https://github.com/hens-msn/henotic-gitco/issues) apakah udah ada yang report
2. Kalau belum ada, buat issue baru dengan:
   - **Clear title** yang describe bugnya
   - **Steps to reproduce** yang detail
   - **Expected vs actual behavior**
   - **Environment info** (OS, shell, git version)
   - **Screenshots** kalau perlu

### 💡 Feature Requests
Punya ide fitur keren?
1. Buat issue dengan label "enhancement"
2. Explain **why** fitur ini berguna
3. Kasih **examples** use casenya
4. Diskusi dulu sebelum implementasi

### 🔧 Code Contributions

#### Fork & Clone
```bash
# Fork repo di GitHub, terus clone
git clone https://github.com/yourusername/henotic-gitco.git
cd henotic-gitco
```

#### Development Setup
```bash
# Install untuk testing
chmod +x install.sh
./install.sh

# Test di terminal baru
gitco --help
```

#### Making Changes
1. **Create branch** untuk fitur/bugfix kamu:
   ```bash
   git checkout -b feat/awesome-feature
   # atau
   git checkout -b fix/some-bug
   ```

2. **Edit files** sesuai kebutuhan:
   - `gitco.sh` - Main script
   - `install.sh` - Installer
   - `uninstall.sh` - Uninstaller
   - `README.md` - Documentation
   - `CHANGELOG.md` - Version history

3. **Test thoroughly**:
   ```bash
   # Test all commands
   gitco feat "test feature"
   gitco quick "test quick"
   gitco amend fix "test amend"
   gitco push ui "test push" # (hati-hati, ini real push)
   
   # Test error cases
   gitco invalid "test"
   gitco feat  # no message
   gitco  # no args
   ```

4. **Follow conventions**:
   - Gunakan indentasi 4 spasi
   - Commit pakai Henotic Gitco format: `gitco feat "add awesome feature"`
   - Update CHANGELOG.md kalau perlu
   - Update README.md kalau ada breaking changes

#### Code Style
- **Bash style**: Follow existing patterns
- **Comments**: Bahasa Indonesia oke, tapi function names tetap English
- **Error messages**: Friendly dan helpful, boleh pakai emoji 😄
- **Colors**: Gunakan yang udah ada (RED, GREEN, YELLOW, dll)

#### Testing Checklist
- [ ] Works di bash
- [ ] Works di zsh  
- [ ] Tab completion works
- [ ] All commit types work
- [ ] Auto-detection logic works
- [ ] Error handling works
- [ ] Help output is correct
- [ ] No breaking changes (unless major version)

### 📝 Pull Request Process

1. **Update documentation** kalau perlu
2. **Add yourself** ke contributors di README (optional)
3. **Create PR** dengan description yang clear:
   ```markdown
   ## What
   Brief description of changes
   
   ## Why  
   Why this change is needed
   
   ## How
   How you implemented it
   
   ## Testing
   How you tested it
   ```

4. **Wait for review** - aku akan review ASAP! 

### 🎯 Priority Areas

Kalau mau contribute tapi bingung mulai dari mana, ini yang lagi dibutuhin:

**High Priority:**
- 🧪 **Testing framework** - Automated tests
- 📖 **Better documentation** - More examples, use cases
- 🐛 **Bug fixes** - Check existing issues
- 🎨 **Shell compatibility** - Fish shell, PowerShell support

**Medium Priority:**
- ✨ **New commit types** - Industry-specific types
- 🔧 **Configuration file** - `.gitcorc` for custom settings
- 📊 **Stats/analytics** - Commit type usage stats
- 🎯 **Git hooks integration** - Pre-commit hook support

**Low Priority:**
- 🌐 **Localization** - Other languages support
- 🎨 **Themes** - Different color schemes
- 📱 **Mobile/Termux** compatibility

### 🚫 What NOT to Contribute

- Breaking changes tanpa diskusi dulu
- Features yang too complex/niche
- Dependencies yang berat (keep it lightweight!)
- Code yang gak ada unit tests (coming soon)

### 🎉 Recognition

Semua contributors akan:
- 📝 Listed di README.md
- 🏷️ Tagged di release notes
- ❤️ Get our eternal gratitude!

## 💬 Communication

- **GitHub Issues** - Bug reports, feature requests
- **GitHub Discussions** - General discussion, questions
- **PR Comments** - Code review, technical discussion

## 📄 License

Dengan contribute, kamu agree bahwa contributions kamu akan licensed under MIT License yang sama.

---

**Happy Contributing!** 🚀

Made with ❤️ by Henotic AI - Script Andalan Sejuta Umat!