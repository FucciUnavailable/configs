-- Which-Key: Shows available keybindings in a popup
-- This is what shows the command help box you wanted!

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    local wk = require("which-key")
    wk.setup({
      plugins = {
        marks = true,
        registers = true,
        spelling = {
          enabled = true,
          suggestions = 20,
        },
      },
      window = {
        border = "rounded",
        position = "bottom",
      },
    })

    -- Register leader key groups
    wk.register({
      ["<leader>f"] = { name = "Find" },
      ["<leader>b"] = { name = "Buffer" },
      ["<leader>c"] = { name = "Code" },
      ["<leader>d"] = { name = "Diagnostics" },
      ["<leader>g"] = { name = "Git" },
      ["<leader>s"] = { name = "Split" },
      ["<leader>t"] = { name = "Tab/Terminal" },
      ["<leader>n"] = { name = "No Highlight" },
      ["<leader>q"] = { name = "Quit" },
      ["<leader>r"] = { name = "Rename" },
      ["<leader>o"] = { name = "Open" },
    })
  end,
}
