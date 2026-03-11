local M = {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "AndreM222/copilot-lualine",
  },
}

function M.config()
  local lualine = require("lualine")

  local diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    symbols = { error = " ", warn = " ", info = " ", hint = " " },
    colored = true,
    update_in_insert = false,
  }

  local branch = {
    "branch",
    icon = "",  -- Git branch icon
  }

  local filetype = {
    "filetype",
    icons_enabled = true,
  }

  lualine.setup {
    options = {
      theme = "auto",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = { "NvimTree", "packer" },
    },
    sections = {
      lualine_a = {"mode"},
      lualine_b = { branch },
      lualine_c = { diagnostics },
      lualine_x = { "copilot", filetype },
      lualine_y = { "progress" },
      lualine_z = {},
    },
    extensions = { "quickfix", "man", "fugitive" },
  }
end

return M
