local M = {
  "HiPhish/rainbow-delimiters.nvim",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
}

function M.config()
  local rainbow_delimiters = require("rainbow-delimiters")

  vim.g.rainbow_delimiters = {
    strategy = {
      [""] = rainbow_delimiters.strategy.global,
    },
    query = {
      [""] = "rainbow-delimiters",
    },
    highlight = {
      "RainbowDelimiterRed",
      "RainbowDelimiterYellow",
      "RainbowDelimiterBlue",
      "RainbowDelimiterOrange",
      "RainbowDelimiterGreen",
      "RainbowDelimiterViolet",
      "RainbowDelimiterCyan",
    },
  }

  -- Optional: define colors (remove if your colorscheme handles this)
  vim.api.nvim_set_hl(0, "RainbowDelimiterRed",    { fg = "#ff6b6b" })
  vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { fg = "#ffd166" })
  vim.api.nvim_set_hl(0, "RainbowDelimiterBlue",   { fg = "#4cc9f0" })
  vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", { fg = "#f08a5d" })
  vim.api.nvim_set_hl(0, "RainbowDelimiterGreen",  { fg = "#06d6a0" })
  vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { fg = "#c77dff" })
  vim.api.nvim_set_hl(0, "RainbowDelimiterCyan",   { fg = "#00f5d4" })
end

return M
