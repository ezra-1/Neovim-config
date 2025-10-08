# 🌀 Neovim Config by Ezra

[![Neovim Version](https://img.shields.io/badge/Neovim-0.11%2B-blue.svg)](#)  
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](#)

A **modular, stable, and easy-to-extend** Neovim configuration that blends an IDE-like experience with simplicity.  
Use it as a full setup, or pick & choose modules — it’s built to scale.

---

## 🚀 Why This Config?

I built this setup to strike a balance between:

- **Stability**: All plugins are pinned to versions to avoid sudden breaking updates  
- **Clarity**: Modular structure with readable code  
- **Flexibility**: You can enable, disable, or swap modules as you like  
- **Beginner friendliness**: Clear documentation, defaults that “just work,” but room for customization

---

## ✨ Features

- **Version‑pinned plugins** for reliability  
- **Modular file structure** — each plugin or feature in its own file  
- **IDE-Like features**: LSP, autocompletion, Treesitter, fuzzy file finder  
- **Cross-platform support**: macOS, Linux (X11 / Wayland)  
- **Clipboard integration**: `xsel`, `wl-clipboard`, `pbcopy`  
- **Language tooling**: Python (via `pynvim`), optional Node support (for JS/TS tools)  
- **Search tool**: `ripgrep` required for full fuzzy search power  

---

## 🛠 Installation

> ⚠️ Make a backup of your existing `~/.config/nvim` if you have one

```bash
git clone https://github.com/ezra-1/Neovim-config.git ~/.config/nvim
```

Start Neovim:

```bash
nvim
```

It will auto-install plugins.  
Note: Treesitter may download many parsers on first run.

---

## 📦 Dependencies & Setup

| Component | Purpose | Installation |
|----------|---------|--------------|
| `python-pynvim` | Python support | `pip install pynvim` |
| `node + neovim` | JS/TS tooling | `npm i -g neovim` |
| `ripgrep` | Fast fuzzy search | `sudo apt install ripgrep` (Linux) |
| Clipboard tool | For copy/paste | `xsel` (X11) / `wl-clipboard` (Wayland) / `pbcopy` (macOS) |

After installing, run in Neovim:

```vim
:checkhealth
```

---

## ⚙ Configuration Overview

- `init.lua` — Entry point and module loader  
- `lua/` — Folder containing modules like `plugins.lua`, `lsp.lua`, `settings.lua`  
- `ft/` — Filetype-specific overrides  
- `after/` — Final overrides to tweak plugin behavior  

Feel free to dive in, disable modules, or add your own.

---

## 💡 Usage Tips & Troubleshooting

1. **Check health**  
   ```vim
   :checkhealth
   ```
   It often shows missing dependencies (python, node, clipboard tool).

2. **Updating plugins**  
   Use your plugin manager’s update command (e.g. `:PackerSync`).

3. **Treesitter issues**  
   If parsing fails, try `:TSUpdate`.

4. **Better icons & symbols**  
   Use a Nerd Font or patched font with glyph support.

5. **Custom overrides**  
   Use `after/` or `ft/` folders for overrides without touching main modules.

---

## 🤝 Contributing & Support

- Feel free to open issues or PRs  
- Add your own module or tweak existing ones  
- Please follow code style (formatting, indentation) for consistency  
- Optionally, I’m open to helping you adapt this config for your languages / workflows

---

## 📜 License

This config is released under the **MIT License** — see [LICENSE](LICENSE) for details.

---

> “The computing scientist’s main challenge is not to get confused by the complexities of his own making.”  
> — Edsger W. Dijkstra
