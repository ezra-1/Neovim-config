local M = {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}

function M.config()
  require("obsidian").setup({
    workspaces = {
      {
        name = "personal",
        path = "~/vaults/personal",
      },
    },

    notes_subdir = "notes",

    daily_notes = {
      folder = "daily",
      date_format = "%Y-%m-%d",
      alias_format = "%B %-d, %Y",
    },

    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },

    mappings = {
      ["gf"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
    },

    new_notes_location = "notes_subdir",

    templates = {
      folder = "templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
    },
  })
end

return M
