#!/bin/bash
# Check what's installed and what's missing

echo ""
echo "╔════════════════════════════════════════════════════════╗"
echo "║     🔍 Development Environment Check 🔍                ║"
echo "╚════════════════════════════════════════════════════════╝"
echo ""

check_tool() {
    local tool=$1
    local name=$2
    if command -v "$tool" &> /dev/null; then
        echo "✅ $name installed: $(command -v $tool)"
    else
        echo "❌ $name NOT installed"
        return 1
    fi
}

check_file() {
    local file=$1
    local name=$2
    if [ -f "$file" ]; then
        echo "✅ $name exists"
    else
        echo "❌ $name NOT found"
        return 1
    fi
}

check_dir() {
    local dir=$1
    local name=$2
    if [ -d "$dir" ]; then
        echo "✅ $name exists"
    else
        echo "❌ $name NOT found"
        return 1
    fi
}

echo "=== Core Tools ==="
check_tool "nvim" "Neovim"
check_tool "tmux" "tmux"
check_tool "fzf" "fzf"
check_tool "rg" "ripgrep"
check_tool "bat" "bat"
check_tool "eza" "eza"
check_tool "zoxide" "zoxide"
check_tool "git" "git"
check_tool "node" "Node.js"
check_tool "npm" "npm"

echo ""
echo "=== Configuration Files ==="
check_file "$HOME/.bashrc" "bashrc"
check_file "$HOME/.config/nvim/init.lua" "Neovim config"
check_file "$HOME/.config/tmux/tmux.conf" "tmux config"

echo ""
echo "=== Neovim Plugins ==="
check_dir "$HOME/.local/share/nvim/lazy" "Lazy.nvim (plugin manager)"

echo ""
echo "=== tmux Plugins ==="
check_dir "$HOME/.tmux/plugins/tpm" "TPM (tmux plugin manager)"

echo ""
echo "╔════════════════════════════════════════════════════════╗"
echo "║                    Summary                             ║"
echo "╚════════════════════════════════════════════════════════╝"
echo ""

missing_count=0

if ! command -v nvim &> /dev/null; then
    echo "⚠️  Install Neovim: Run wsl-setup.sh"
    ((missing_count++))
fi

if ! command -v tmux &> /dev/null; then
    echo "⚠️  Install tmux: sudo apt install tmux"
    ((missing_count++))
fi

if ! command -v fzf &> /dev/null; then
    echo "⚠️  Install fzf: sudo apt install fzf"
    ((missing_count++))
fi

if [ ! -f "$HOME/.config/nvim/init.lua" ]; then
    echo "⚠️  Copy Neovim config: cp -r .config/nvim ~/.config/"
    ((missing_count++))
fi

if [ ! -f "$HOME/.config/tmux/tmux.conf" ]; then
    echo "⚠️  Copy tmux config: cp -r .config/tmux ~/.config/"
    ((missing_count++))
fi

if [ $missing_count -eq 0 ]; then
    echo "🎉 Everything looks good! You're all set!"
    echo ""
    echo "Next steps:"
    echo "1. Start Neovim: nvim"
    echo "2. Start tmux: tmux"
    echo "3. Read README.md for usage guide"
else
    echo ""
    echo "❗ $missing_count items need attention"
    echo "   Run 'bash wsl-setup.sh' to install everything"
fi

echo ""
