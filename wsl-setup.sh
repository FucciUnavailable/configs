#!/bin/bash
# Complete WSL Development Environment Setup
# Run this in your actual WSL: bash wsl-setup.sh

set -e

echo "🚀 Installing Development Tools..."

# Update system
sudo apt update

# Install essentials
sudo apt install -y \
    build-essential \
    git \
    curl \
    wget \
    unzip \
    ripgrep \
    fd-find \
    tmux \
    fzf \
    bat \
    htop \
    tree \
    ncdu \
    silversearcher-ag \
    zoxide \
    python3-pip \
    nodejs npm

# Install latest Neovim
echo "📦 Installing Neovim..."
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
rm nvim-linux64.tar.gz
sudo ln -sf /opt/nvim-linux64/bin/nvim /usr/local/bin/nvim

# Install LazyVim
echo "⚡ Installing LazyVim..."
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

# Install tpm (tmux plugin manager)
echo "🖥️  Installing tmux plugin manager..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install starship prompt (optional but awesome)
curl -sS https://starship.rs/install.sh | sh -s -- -y

# Setup fd symlink (it's called fdfind on Ubuntu)
sudo ln -sf $(which fdfind) /usr/local/bin/fd

# Install eza (better ls)
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt update
sudo apt install -y eza

echo "✅ Installation complete!"
echo ""
echo "Next steps:"
echo "1. Restart your terminal or run: source ~/.bashrc"
echo "2. Launch nvim - it will auto-install plugins on first run"
echo "3. In tmux, press Ctrl+Space then I to install tmux plugins"
echo ""
echo "Enjoy your new setup! 🎉"
