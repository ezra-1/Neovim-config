local M = {
  "lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
}

function M.config()
  local hooks = require("ibl.hooks")

  -- Gray highlight group
  hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "IndentGray", { fg = "#5c6370" }) -- muted gray
  end)

  -- Main setup
  require("ibl").setup({
    indent = {
      char = "│",
      highlight = { "IndentGray" }, -- all indents gray
    },
    scope = {
      enabled = true,
      show_start = true,
      show_end = false,
      highlight = "IndentGray", -- gray scope highlight
    },
    whitespace = {
      remove_blankline_trail = true, -- remove trailing indent guides
    },
    exclude = {
      filetypes = {
        "help",
        "dashboard",
        "lazy",
        "NvimTree",
        "Trouble",
        "startify",
        "text",
      },
      buftypes = {
        "terminal",
        "nofile",
      },
    },
  })
end

return M
