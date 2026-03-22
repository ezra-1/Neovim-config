local M = {
  "zaldih/themery.nvim",
  lazy = false,
  priority = 999,
}

function M.config()
  local themery = require("themery")

  themery.setup({
    themes = {
      { name = "Tokyo Night (Moon)",  colorscheme = "tokyonight-moon" },
      { name = "Tokyo Night (Storm)", colorscheme = "tokyonight-storm" },
      { name = "Catppuccin Mocha",    colorscheme = "catppuccin-mocha" },
      { name = "Gruvbox",             colorscheme = "gruvbox" },
      { name = "Everforest",          colorscheme = "everforest" },
      { name = "Rose Pine",           colorscheme = "rose-pine" },
      { name = "Nord",                colorscheme = "nord" },
      { name = "Dracula",             colorscheme = "dracula" },
    },
    livePreview = true,
  })

  -- keymap
  vim.keymap.set("n", "<leader>c", "<cmd>Themery<cr>", { desc = "Colorscheme" })
end

return M
