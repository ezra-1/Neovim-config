local M = {
  "folke/snacks.nvim",
  event = "VeryLazy",
}

function M.config()
  require("snacks").setup {
    input = {
      enabled = true,
      default_prompt = "Input:",
      title_pos = "left",
      insert_only = true,
      start_in_insert = true,
      border = "rounded",
      relative = "cursor",
      prefer_width = 40,
      max_width = { 140, 0.9 },
      min_width = { 20, 0.2 },
      buf_options = {},
      win_options = {
        winblend = 10,
        wrap = false,
        list = true,
        listchars = "precedes:…,extends:…",
        sidescrolloff = 0,
      },
    },

    select = {
      enabled = true,
      backend = { "nui", "telescope", "fzf_lua", "fzf", "builtin" },
      trim_prompt = true,

      nui = {
        position = "50%",
        relative = "editor",
        border = { style = "rounded" },
        buf_options = {
          swapfile = false,
          filetype = "SnacksSelect",
        },
        win_options = { winblend = 10 },
        max_width = 80,
        max_height = 40,
        min_width = 40,
        min_height = 10,
      },

      builtin = {
        border = "rounded",
        relative = "editor",
        buf_options = {},
        win_options = {
          winblend = 10,
          cursorline = true,
          cursorlineopt = "both",
        },
        max_width = { 140, 0.8 },
        min_width = { 40, 0.2 },
        max_height = 0.9,
        min_height = { 10, 0.2 },
        mappings = {
          ["<Esc>"] = "Close",
          ["<C-c>"] = "Close",
          ["<CR>"] = "Confirm",
        },
      },
    },

    -- 👇 Add explorer here
    explorer = {
      enabled = true,     -- 👈 must enable it
      replace_netrw = true,
      auto_close = false,
      columns = { "icon", "permissions", "size", "mtime" },
      diagnostics = {
        enable = true,
      },
    },

    -- 🔔 Notifications
    notifier = {
      enabled = true,
      timeout = 3000, -- ms
      top_down = true,
      max_width = 80,
      icons = {},
      level = vim.log.levels.INFO,
    },

    -- 🧘 Zen Mode
    zen = {
      enabled = true,
      toggles = {
        ufo             = true,
        dim             = true,
        git_signs       = false,
        diagnostics     = false,
        line_number     = false,
        relative_number = false,
        signcolumn      = "no",
        indent          = false,
      },
      window = {
        backdrop = 0.95,
        width = 0.7,
        height = 0.9,
        options = {},
      },
    },
  }

  local wk = require "which-key"
  wk.add {
    { "<leader>e", function() require("snacks.explorer").open() end, desc = "Explorer" },
  }
end

return M
