local M = {
  "folke/snacks.nvim",
  event = "VimEnter",
}

function M.config()
  local snacks = require("snacks")
  local icons = require("ui.icons")
  local wk = require("which-key")

  snacks.setup({
    ---------------------------------------------------------------------------
    -- 🪄 Input
    ---------------------------------------------------------------------------
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
      win_options = {
        winblend = 10,
        wrap = false,
        list = true,
        listchars = "precedes:…,extends:…",
        sidescrolloff = 0,
      },
    },

    ---------------------------------------------------------------------------
    -- 🔍 Select
    ---------------------------------------------------------------------------
    select = {
      enabled = true,
      backend = { "nui", "telescope", "fzf_lua", "fzf", "builtin" },
      trim_prompt = true,
      nui = {
        position = "50%",
        relative = "editor",
        border = { style = "rounded" },
        buf_options = { swapfile = false, filetype = "SnacksSelect" },
        win_options = { winblend = 10 },
        max_width = 80,
        max_height = 40,
        min_width = 40,
        min_height = 10,
      },
      builtin = {
        border = "rounded",
        relative = "editor",
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

    ---------------------------------------------------------------------------
    -- 📁 File Explorer
    ---------------------------------------------------------------------------
    explorer = {
      enabled = true,
      replace_netrw = true,
      auto_close = false,
      columns = { "icon", "permissions", "size", "mtime" },
      diagnostics = { enable = true },
    },

    ---------------------------------------------------------------------------
    -- 🔔 Transparent Notifier
    ---------------------------------------------------------------------------
    notifier = {
      enabled = true,
      timeout = 3000,
      top_down = true,
      max_width = 80,
      background_colour = "#000000",
      -- level = vim.log.levels.INFO,
      icons = {
        error = " ",
        warn  = " ",
        info  = " ",
        debug = " ",
        trace = "✎ ",
      },
    },

    ---------------------------------------------------------------------------
    -- 🧘 Zen Mode
    ---------------------------------------------------------------------------
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
      },
    },

    ---------------------------------------------------------------------------
    -- 🌀 LazyGit Integration
    ---------------------------------------------------------------------------
    lazygit = {
      enabled = true,
      win = {
        border = "rounded",
        relative = "editor",
        width = 0.9,
        height = 0.9,
        row = 0.05,
        col = 0.05,
        style = "minimal",
        focusable = true,
        zindex = 50,
        winblend = 20,
      },
    },

    ---------------------------------------------------------------------------
    -- 🧠 Terminal Integration
    ---------------------------------------------------------------------------
    terminal = {
      enabled = true,
      float = {
        border = "rounded",
        width = 0.9,
        height = 0.9,
        winblend = 15,
        style = "minimal",
      },
      start_in_insert = true,
      auto_close = false,
      shell = vim.o.shell,
    },

    ---------------------------------------------------------------------------
    -- 🏁 Dashboard (Alpha-Nvim Style)
    ---------------------------------------------------------------------------
    dashboard = {
      enabled = true,

      header = {
        [[███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
        [[████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
        [[██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
        [[██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
        [[██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
        [[╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
      },

      center = {
        { icon = icons.ui.Files,    desc = " Find File",     key = "f", action = "Telescope find_files" },
        { icon = icons.ui.NewFile,  desc = " New File",      key = "n", action = ":ene <BAR> startinsert <CR>" },
        { icon = icons.git.Repo,    desc = " Projects",      key = "p", action = "lua require('telescope').extensions.projects.projects()" },
        { icon = icons.ui.History,  desc = " Recent Files",  key = "r", action = "Telescope oldfiles" },
        { icon = icons.ui.Text,     desc = " Find Text",     key = "t", action = "Telescope live_grep" },
        { icon = icons.ui.Gear,     desc = " Config",        key = "c", action = "e ~/.config/nvim/init.lua" },
        { icon = icons.ui.SignOut,  desc = " Quit",          key = "q", action = "qa" },
      },

      footer = { "Loading plugins..." },

      opts = {
        border = "rounded",
        winblend = 10,
        padding = 2,
        width = 60,
      },
    },
  })

  ---------------------------------------------------------------------------
  -- 🧩 Dynamic Footer Update (No set_footer)
  ---------------------------------------------------------------------------
  vim.api.nvim_create_autocmd("User", {
    pattern = "LazyVimStarted",
    callback = function()
      local stats = require("lazy").stats()
      local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
      local dashboard = require("snacks").dashboard
      if dashboard and dashboard.config then
        dashboard.config.footer = {
          "⚡ Loaded " .. stats.count .. " plugins in " .. ms .. "ms",
        }
        vim.cmd("redraw!")
      end
    end,
  })

  ---------------------------------------------------------------------------
  -- 📉 Hide statusline while dashboard is open
  ---------------------------------------------------------------------------
  vim.api.nvim_create_autocmd("User", {
    pattern = "SnacksDashboardReady",
    callback = function()
      vim.cmd([[
        set laststatus=0
        autocmd BufUnload <buffer> set laststatus=3
      ]])
    end,
  })

  ---------------------------------------------------------------------------
  -- 🧩 Toggle UFO folds
  ---------------------------------------------------------------------------
  Snacks = require("snacks")
  Snacks.toggle.new({
    id = "ufo",
    name = "Enable/Disable UFO folds",
    get = function()
      return require("ufo").inspect()
    end,
    set = function(state)
      if state == nil then
        require("noice").enable()
        require("ufo").enable()
        vim.o.foldenable = true
        vim.o.foldcolumn = "1"
      else
        require("noice").disable()
        require("ufo").disable()
        vim.o.foldenable = false
        vim.o.foldcolumn = "0"
      end
    end,
  })

  ---------------------------------------------------------------------------
  -- 🔑 Keymaps
  ---------------------------------------------------------------------------
  wk.add {
    { "<leader>e",  function() require("snacks.explorer").open() end, desc = "Explorer" },
    { "<leader>z",  function() require("snacks.zen").zen() end, desc = "Zen Mode" },
    { "<leader>n",  function() require("snacks.notifier").show_history() end, desc = "Notifications" },
    { "<leader>gj", function() require("snacks.lazygit").open() end, desc = "LazyGit" },
    { "<leader>;",  function() require("snacks.terminal").toggle() end, desc = "Terminal" },
  }

  ---------------------------------------------------------------------------
  -- 💾 Save Notification
  ---------------------------------------------------------------------------
  vim.api.nvim_create_autocmd("BufWritePost", {
    callback = function(args)
      local file = vim.fn.fnamemodify(args.file, ":t")
      vim.notify("Saved " .. file .. " ✅", vim.log.levels.INFO, { title = "File Saved" })
    end,
  })
end

return M
