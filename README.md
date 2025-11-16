# 🚀 Ultimate Linux Development Environment Setup


## 📦 What's Included

### Core Tools
- **Neovim** - Modern, extensible text editor with LazyVim configuration
- **tmux** - Terminal multiplexer with beautiful theme
- **fzf** - Fuzzy finder for files, commands, and more
- **ripgrep** - Lightning fast grep alternative
- **bat** - Cat with syntax highlighting
- **eza** - Modern ls replacement with icons
- **zoxide** - Smarter cd command

### Neovim Features
✅ **Auto-completion** - Smart code completion as you type
✅ **LSP Support** - IntelliSense for multiple languages
✅ **AI Intellisense** - FREE Codeium AI (like Copilot)
✅ **File Explorer** - Neo-tree with icon support
✅ **Fuzzy Finder** - Telescope for finding anything
✅ **Syntax Highlighting** - Treesitter for beautiful code
✅ **Git Integration** - GitSigns for inline git status
✅ **Command Helper** - Which-key shows available commands
✅ **Auto-pairs** - Automatically close brackets and quotes
✅ **Beautiful UI** - Status line, tabs, and dashboard

## 🛠️ Installation

### Option 1: Quick Setup (Recommended)
Run this in your WSL terminal:

```bash
# 1. Copy the wsl-setup.sh script to your WSL
# 2. Run it:
bash wsl-setup.sh
```

### Option 2: Manual Installation

```bash
# Install tools
sudo apt update
sudo apt install -y git curl wget build-essential tmux fzf ripgrep fd-find bat nodejs npm python3-pip

# Install latest Neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo tar -C /opt -xzf nvim-linux64.tar.gz
sudo ln -sf /opt/nvim-linux64/bin/nvim /usr/local/bin/nvim

# Install eza (better ls)
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo apt update && sudo apt install -y eza

# Install zoxide (better cd)
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

# Copy all config files to ~/.config
cp -r .config ~/

# Copy bashrc
cp .bashrc ~/

# Install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Reload bashrc
source ~/.bashrc
```

## 🎮 Usage Guide

### First Launch

1. **Start Neovim:**
   ```bash
   nvim
   ```
   - First launch will auto-install all plugins (takes 2-3 minutes)
   - You'll see a beautiful dashboard

2. **Start tmux:**
   ```bash
   tmux
   # Press Ctrl+Space then I to install tmux plugins
   ```

### Neovim Cheatsheet

#### Leader Key = `Space`

#### File Navigation
- `Space + e` - Toggle file explorer
- `Space + ff` - Find files (fuzzy search)
- `Space + fg` - Find text in files (grep)
- `Space + fb` - Browse open buffers
- `Space + fr` - Recent files
- `Ctrl + h/j/k/l` - Navigate between splits

#### Editing
- `gcc` - Comment/uncomment line
- `gc` + motion - Comment selection
- `cs"'` - Change surrounding quotes
- `ds"` - Delete surrounding quotes
- `ys` + motion + char - Add surrounding

#### LSP (Code Intelligence)
- `gd` - Go to definition
- `gr` - Go to references
- `gi` - Go to implementation
- `K` - Hover documentation
- `Space + ca` - Code actions
- `Space + rn` - Rename symbol
- `[d` / `]d` - Previous/next diagnostic

#### Auto-completion
- `Ctrl + Space` - Trigger completion
- `Tab` / `Shift + Tab` - Navigate suggestions
- `Enter` - Confirm selection
- `Ctrl + e` - Close completion menu

#### AI Completion (Codeium)
- `Ctrl + g` - Accept AI suggestion
- `Ctrl + ;` - Next suggestion
- `Ctrl + ,` - Previous suggestion
- `Ctrl + x` - Clear suggestion

#### Buffers & Tabs
- `Shift + h` - Previous buffer
- `Shift + l` - Next buffer
- `Space + bd` - Delete buffer
- `Space + to` - Open new tab
- `Space + tx` - Close tab

#### Splits
- `Space + sv` - Split vertically
- `Space + sh` - Split horizontally
- `Space + se` - Make splits equal
- `Space + sx` - Close split

### Tmux Cheatsheet

#### Prefix = `Ctrl + Space`

#### Sessions
- `tmux` - Start new session
- `tmux new -s name` - New named session
- `tmux ls` - List sessions
- `tmux attach -t name` - Attach to session
- Prefix + `d` - Detach from session

#### Windows (Tabs)
- Prefix + `c` - Create window
- Prefix + `n` - Next window
- Prefix + `p` - Previous window
- Prefix + `,` - Rename window
- Prefix + `&` - Kill window

#### Panes (Splits)
- Prefix + `|` - Split horizontal
- Prefix + `-` - Split vertical
- Prefix + `h/j/k/l` - Navigate panes
- Prefix + `H/J/K/L` - Resize panes
- Prefix + `x` - Kill pane

#### Other
- Prefix + `r` - Reload config
- Prefix + `[` - Enter copy mode (use vim keys)
- Prefix + `I` - Install plugins

### Bash/FZF Features

#### Fuzzy Finding
- `Ctrl + r` - Fuzzy command history
- `Ctrl + t` - Fuzzy file search
- `fe` - Find and edit file
- `fcd` - Fuzzy cd into directory
- `fco` - Fuzzy git checkout
- `fkill` - Fuzzy process kill

#### Navigation
- `z directory_name` - Jump to directory (zoxide)
- `..` - Go up one directory
- `...` - Go up two directories

#### Git Aliases
- `gs` - git status
- `ga` - git add
- `gc` - git commit
- `gp` - git push
- `gl` - git pull
- `glog` - Pretty git log

#### System
- `ll` - List files with details
- `la` - List all files
- `lt` - Tree view
- `cat` - View file with syntax highlighting (bat)

## 🎨 Customization

### Change Neovim Colorscheme
Edit `~/.config/nvim/init.lua` and change:
```lua
vim.cmd.colorscheme("tokyonight-night")
```
To: `catppuccin`, `tokyonight-storm`, `tokyonight-day`

### Enable GitHub Copilot
Edit `~/.config/nvim/lua/plugins/ai.lua` and set:
```lua
enabled = true  -- for copilot.vim
```

### Disable Codeium (Free AI)
Edit `~/.config/nvim/lua/plugins/ai.lua` and set:
```lua
enabled = false  -- for codeium.vim
```

### Change tmux Prefix
Edit `~/.config/tmux/tmux.conf` and change:
```bash
set -g prefix C-Space
```

## 🐛 Troubleshooting

### Neovim plugins not installing
```bash
# Open Neovim
nvim
# Run in command mode:
:Lazy sync
```

### Tmux plugins not working
```bash
# In tmux, press:
Ctrl+Space then I
```

### FZF not working
```bash
# Make sure fzf is in PATH:
echo $PATH | grep fzf
# Reload bashrc:
source ~/.bashrc
```

### LSP not working
```bash
# Open Neovim and run:
:Mason
# Install language servers manually
```

## 📚 Additional Resources

- [Neovim Docs](https://neovim.io/doc/)
- [LazyVim](https://www.lazyvim.org/)
- [Tmux Guide](https://github.com/tmux/tmux/wiki)
- [FZF](https://github.com/junegunn/fzf)

## 🎉 Tips & Tricks

1. **Use tmux sessions** - Keep different projects in separate tmux sessions
2. **Learn vim motions** - They'll make you 10x faster
3. **Explore plugins** - Check `:Lazy` in Neovim to see all plugins
4. **Customize keymaps** - Edit `~/.config/nvim/lua/config/keymaps.lua`
5. **Use AI completion** - Codeium is free and works great!

## 💡 Pro Tips

- Press `Space` in Neovim to see all available commands (which-key)
- Use `Space + ff` to quickly open files
- Use `Space + fg` to search across your entire project
- Learn to use tmux for terminal multiplexing
- Use `z` command to jump to frequently used directories

---

**Enjoy your awesome development environment! 🚀**

Questions? Check the configs in `~/.config/nvim/` and `~/.config/tmux/`
