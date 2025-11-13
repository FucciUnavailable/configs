-- Keymaps
-- Leader key is <Space>

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Better window navigation
keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Resize windows
keymap.set("n", "<C-Up>", ":resize +2<CR>", opts)
keymap.set("n", "<C-Down>", ":resize -2<CR>", opts)
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Buffer navigation
keymap.set("n", "<S-l>", ":bnext<CR>", opts)
keymap.set("n", "<S-h>", ":bprevious<CR>", opts)
keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })

-- Clear search highlighting
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Better indenting
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

-- Move text up and down
keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Keep cursor centered
keymap.set("n", "<C-d>", "<C-d>zz", opts)
keymap.set("n", "<C-u>", "<C-u>zz", opts)
keymap.set("n", "n", "nzzzv", opts)
keymap.set("n", "N", "Nzzzv", opts)

-- Paste without yanking
keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without yanking" })

-- Save file
keymap.set("n", "<C-s>", ":w<CR>", opts)

-- Quit
keymap.set("n", "<leader>qq", ":qa<CR>", { desc = "Quit all" })

-- New file
keymap.set("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- Split windows
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", ":close<CR>", { desc = "Close current split" })

-- Tab management
keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "Go to previous tab" })

-- Terminal
keymap.set("n", "<leader>tt", ":terminal<CR>", { desc = "Open terminal" })
keymap.set("t", "<Esc>", "<C-\\><C-n>", opts) -- Exit terminal mode

-- File explorer (Neo-tree)
keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle file explorer" })

-- Telescope (fuzzy finder) - these will work once telescope is installed
keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find files" })
keymap.set("n", "<leader>fr", ":Telescope oldfiles<CR>", { desc = "Recent files" })
keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Find text" })
keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "Find buffers" })
keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", { desc = "Help tags" })

-- LSP keymaps (will be set when LSP attaches)
keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to references" })
keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Line diagnostics" })
keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
