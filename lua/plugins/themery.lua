local M = {
  "zaldih/themery.nvim",
  lazy = false,
  priority = 999,
}

function M.config()
  local themery = require("themery")

  themery.setup({
    themes = {
      -- Tokyo Night
      { name = "Tokyo Night Moon", colorscheme = "tokyonight-moon" },
      { name = "Tokyo Night Storm", colorscheme = "tokyonight-storm" },
      { name = "Tokyo Night Night", colorscheme = "tokyonight-night" },

      -- Aura
      { name = "Aura Dark", colorscheme = "aura-dark" },
      { name = "Aura Soft Dark", colorscheme = "aura-soft-dark" },

      -- Catppuccin
      { name = "Catppuccin Latte", colorscheme = "catppuccin-latte" },
      { name = "Catppuccin Frappé", colorscheme = "catppuccin-frappe" },
      { name = "Catppuccin Macchiato", colorscheme = "catppuccin-macchiato" },
      { name = "Catppuccin Mocha", colorscheme = "catppuccin-mocha" },

      -- Rose Pine
      { name = "Rose Pine", colorscheme = "rose-pine" },
      { name = "Rose Pine Moon", colorscheme = "rose-pine-moon" },
      { name = "Rose Pine Dawn", colorscheme = "rose-pine-dawn" },

      -- Nightfox
      { name = "Nightfox", colorscheme = "nightfox" },
      { name = "Nordfox", colorscheme = "nordfox" },
      { name = "Duskfox", colorscheme = "duskfox" },

      -- Kanagawa
      { name = "Kanagawa Wave", colorscheme = "kanagawa-wave" },
      { name = "Kanagawa Dragon", colorscheme = "kanagawa-dragon" },
      { name = "Kanagawa Lotus", colorscheme = "kanagawa-lotus" },

      -- OneDark
      { name = "OneDark", colorscheme = "onedark" },

      -- Everforest
      { name = "Everforest", colorscheme = "everforest" },

      -- Gruvbox
      { name = "Gruvbox", colorscheme = "gruvbox" },
      { name = "Gruvbox Material", colorscheme = "gruvbox-material" },

      -- GitHub Theme
      { name = "Github Dark", colorscheme = "github_dark" },
      { name = "Github Light", colorscheme = "github_light" },

      -- Dracula
      { name = "Dracula", colorscheme = "dracula" },

      -- Ayu
      { name = "Ayu Dark", colorscheme = "ayu-dark" },
      { name = "Ayu Light", colorscheme = "ayu-light" },
      { name = "Ayu Mirage", colorscheme = "ayu-mirage" },

      -- Solarized
      { name = "Solarized Dark", colorscheme = "solarized" },

      -- Nord
      { name = "Nord", colorscheme = "nord" },

      -- Dark+
      { name = "Dark+", colorscheme = "darkplus" },

      -- One Monokai
      { name = "One Monokai", colorscheme = "one_monokai" },
    },

    livePreview = true,
  })

  -- Open theme picker
  vim.keymap.set("n", "<leader>c", "<cmd>Themery<CR>", {
    desc = "Open colorscheme picker",
  })
end

return M
