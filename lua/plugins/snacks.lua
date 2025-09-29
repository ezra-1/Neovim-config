local M = {
  "folke/snacks.nvim",
  event = "VeryLazy",
}

function M.config()
  require("snacks").setup {
    input = {
      enabled = true,

      -- Default prompt string
      default_prompt = "Input:",

      -- Can be 'left', 'right', or 'center'
      title_pos = "left",

      -- When true, <Esc> will close the modal
      insert_only = true,

      -- When true, input will start in insert mode.
      start_in_insert = true,

      -- These are passed to nvim_open_win
      border = "rounded",
      relative = "cursor",

      prefer_width = 40,
      width = nil,
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
        size = nil,
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

        width = nil,
        max_width = { 140, 0.8 },
        min_width = { 40, 0.2 },
        height = nil,
        max_height = 0.9,
        min_height = { 10, 0.2 },

        mappings = {
          ["<Esc>"] = "Close",
          ["<C-c>"] = "Close",
          ["<CR>"] = "Confirm",
        },
      },
    },
  }
end

return M

