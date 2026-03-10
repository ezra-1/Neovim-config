local M = {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {},
}

function M.config()
  local flash = require("flash")

  flash.setup({
    modes = {
      search = { enabled = true },
      char = { enabled = true, jump_labels = true },
    },
  })

  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = true }

  -- 🔹 Flash keymaps
  keymap({ "n", "x", "o" }, "s", flash.jump, opts)
  keymap({ "n", "x", "o" }, "S", flash.treesitter, opts)
  keymap("o", "r", flash.remote, opts)
  keymap({ "n", "x", "o" }, "R", flash.treesitter_search, opts)
end

return M
