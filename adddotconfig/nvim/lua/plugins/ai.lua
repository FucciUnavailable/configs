-- AI Code Completion
-- GitHub Copilot and Codeium (free alternative)

return {
  -- GitHub Copilot (requires subscription)
  {
    "github/copilot.vim",
    enabled = false, -- Set to true if you have Copilot
    event = "InsertEnter",
    config = function()
      -- Accept suggestion with Tab
      vim.g.copilot_no_tab_map = true
      vim.api.nvim_set_keymap("i", "<C-y>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
      vim.g.copilot_filetypes = {
        ["*"] = true,
      }
    end,
  },

  -- Codeium (FREE AI completion - like Copilot but free!)
  {
    "Exafunction/codeium.vim",
    event = "BufEnter",
    config = function()
      -- Change '<C-g>' here to any keycode you like.
      vim.keymap.set("i", "<C-g>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<C-;>", function()
        return vim.fn["codeium#CycleCompletions"](1)
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<C-,>", function()
        return vim.fn["codeium#CycleCompletions"](-1)
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<C-x>", function()
        return vim.fn["codeium#Clear"]()
      end, { expr = true, silent = true })
    end,
  },

  -- Alternative: Use Copilot with cmp integration
  {
    "zbirenbaum/copilot.lua",
    enabled = false, -- Set to true if you prefer this version
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = "<C-y>",
            next = "<C-]>",
            prev = "<C-[>",
            dismiss = "<C-e>",
          },
        },
      })
    end,
  },
}
