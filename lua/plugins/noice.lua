local M = {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",   -- UI framework
  },
}

function M.config()
  require("noice").setup {
    lsp = {
      progress = { enabled = true },
      hover = { enabled = true },
      signature = { enabled = true },
    },
    presets = {
      bottom_search = true,        -- search goes to bottom (like classic vim)
      command_palette = true,      -- cmdline & popupmenu together
      long_message_to_split = true,
      inc_rename = false,
      lsp_doc_border = true,       -- border around hover/signature
    },
    messages = {
      enabled = true,
      view = "notify",             -- use nvim-notify for messages
      view_error = "notify",
      view_warn = "notify",
      view_history = "messages",
      view_search = "virtualtext",
    },
    cmdline = {
      enabled = true,
      view = "cmdline_popup",      -- nice floating command line
      format = {
        cmdline = { pattern = "^:", icon = "", lang = "vim" },
        search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
        search_up   = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
        filter      = { pattern = "^:%s*!%s*", icon = "$", lang = "bash" },
        lua         = { pattern = "^:%s*lua%s+", icon = "", lang = "lua" },
        help        = { pattern = "^:%s*he?l?p?%s+", icon = "" },
      },
    },
  }
end

return M

