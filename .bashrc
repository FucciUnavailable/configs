# ~/.bashrc - Modern Bash Configuration

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ============================================
# PATH Configuration
# ============================================
export PATH="$HOME/.local/bin:$PATH"
export EDITOR='nvim'
export VISUAL='nvim'

# ============================================
# History Configuration
# ============================================
HISTSIZE=10000
HISTFILESIZE=20000
HISTCONTROL=ignoreboth:erasedups
shopt -s histappend
shopt -s checkwinsize

# ============================================
# Prompt Configuration
# ============================================
# Starship prompt (if installed, otherwise fallback to default)
if command -v starship &> /dev/null; then
    eval "$(starship init bash)"
else
    # Simple colored prompt
    PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
fi

# ============================================
# FZF Configuration (Fuzzy Finder)
# ============================================
if [ -f /usr/share/doc/fzf/examples/key-bindings.bash ]; then
    source /usr/share/doc/fzf/examples/key-bindings.bash
fi

if [ -f /usr/share/doc/fzf/examples/completion.bash ]; then
    source /usr/share/doc/fzf/examples/completion.bash
fi

# FZF options with preview
export FZF_DEFAULT_OPTS="
    --height 40%
    --layout=reverse
    --border
    --inline-info
    --preview 'bat --style=numbers --color=always --line-range :500 {}'
    --preview-window right:50%:wrap
    --bind 'ctrl-/:toggle-preview'
    --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8
    --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc
    --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

# Use ripgrep for better search
if command -v rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi

# ============================================
# Zoxide (Better cd)
# ============================================
if command -v zoxide &> /dev/null; then
    eval "$(zoxide init bash)"
fi

# ============================================
# Aliases - General
# ============================================
alias ls='eza --icons --group-directories-first' 2>/dev/null || alias ls='ls --color=auto'
alias ll='eza -l --icons --group-directories-first' 2>/dev/null || alias ll='ls -lh'
alias la='eza -la --icons --group-directories-first' 2>/dev/null || alias la='ls -lah'
alias lt='eza --tree --level=2 --icons' 2>/dev/null || alias lt='tree -L 2'

alias grep='grep --color=auto'
alias cat='bat' 2>/dev/null || alias cat='cat'
alias vi='nvim'
alias vim='nvim'
alias v='nvim'

# ============================================
# Aliases - Navigation
# ============================================
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'
alias -- -='cd -'

# ============================================
# Aliases - Git
# ============================================
alias g='git'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
alias gd='git diff'
alias gco='git checkout'
alias gb='git branch'
alias glog='git log --oneline --graph --decorate --all'

# ============================================
# Aliases - System
# ============================================
alias update='sudo apt update && sudo apt upgrade -y'
alias clean='sudo apt autoremove -y && sudo apt autoclean'
alias ports='netstat -tulanp'
alias meminfo='free -m -l -t'
alias psg='ps aux | grep -v grep | grep -i -e VSZ -e'
alias mkdir='mkdir -pv'
alias wget='wget -c'
alias df='df -H'
alias du='du -ch'

# ============================================
# Aliases - Tmux
# ============================================
alias t='tmux'
alias ta='tmux attach -t'
alias tl='tmux ls'
alias tn='tmux new -s'
alias tk='tmux kill-session -t'

# ============================================
# Useful Functions
# ============================================

# Create and enter directory
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# Extract any archive
extract() {
    if [ -f "$1" ]; then
        case "$1" in
            *.tar.bz2)   tar xjf "$1"     ;;
            *.tar.gz)    tar xzf "$1"     ;;
            *.bz2)       bunzip2 "$1"     ;;
            *.rar)       unrar x "$1"     ;;
            *.gz)        gunzip "$1"      ;;
            *.tar)       tar xf "$1"      ;;
            *.tbz2)      tar xjf "$1"     ;;
            *.tgz)       tar xzf "$1"     ;;
            *.zip)       unzip "$1"       ;;
            *.Z)         uncompress "$1"  ;;
            *.7z)        7z x "$1"        ;;
            *)           echo "'$1' cannot be extracted" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Find file in current directory
ff() {
    find . -type f -iname "*$1*"
}

# Find directory in current directory
fd() {
    find . -type d -iname "*$1*"
}

# Fuzzy find and edit file
fe() {
    local file
    file=$(fzf) && nvim "$file"
}

# Fuzzy cd into directory
fcd() {
    local dir
    dir=$(find ${1:-.} -type d 2> /dev/null | fzf) && cd "$dir"
}

# Git fuzzy checkout
fco() {
    local branch
    branch=$(git branch -a | grep -v HEAD | sed 's/remotes\/origin\///' | sort -u | fzf) &&
    git checkout $(echo "$branch" | sed 's/^[* ]*//')
}

# Quickly search and kill a process
fkill() {
    local pid
    pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
    if [ "x$pid" != "x" ]; then
        echo "$pid" | xargs kill -"${1:-9}"
    fi
}

# Show current weather
weather() {
    curl "wttr.in/${1:-}"
}

# ============================================
# Developer Tools
# ============================================

# Python virtual environment
alias activate='source venv/bin/activate'
alias mkvenv='python3 -m venv venv'

# Node/npm
alias ni='npm install'
alias nrs='npm run start'
alias nrd='npm run dev'

# ============================================
# Completion & Other Settings
# ============================================

# Enable bash completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Case-insensitive tab completion
bind 'set completion-ignore-case on'

# Show all autocomplete results immediately
bind 'set show-all-if-ambiguous on'

# Allow UTF-8 input and output
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# ============================================
# Welcome Message
# ============================================
echo ""
echo "  Welcome to your awesome terminal! 🚀"
echo ""
echo "  Quick tips:"
echo "  • Use 'fe' to fuzzy find and edit files"
echo "  • Use 'fcd' to fuzzy cd into directories"
echo "  • Use 't' for tmux, 'v' for neovim"
echo "  • Ctrl+R for fuzzy command history"
echo ""
