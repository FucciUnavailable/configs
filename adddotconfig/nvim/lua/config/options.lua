-- Neovim Options
-- All the settings that make Neovim awesome

local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- Line wrapping
opt.wrap = false

-- Search settings
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Split windows
opt.splitright = true
opt.splitbelow = true

-- Performance
opt.updatetime = 250
opt.timeoutlen = 300

-- Undo & backup
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = vim.fn.stdpath("data") .. "/undo"

-- Completion
opt.completeopt = "menu,menuone,noselect"

-- Mouse
opt.mouse = "a"

-- Show matching brackets
opt.showmatch = true

-- Better completion experience
opt.pumheight = 10

-- Enable persistent undo
if vim.fn.has("persistent_undo") then
  local target_path = vim.fn.expand("~/.config/nvim/undodir")
  if vim.fn.isdirectory(target_path) == 0 then
    vim.fn.mkdir(target_path, "p", 0700)
  end
  opt.undodir = target_path
  opt.undofile = true
end
