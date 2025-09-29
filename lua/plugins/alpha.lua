local M = {
  "goolord/alpha-nvim",
  event = "VimEnter",
}

function M.config()
  local alpha = require("alpha")
  local dashboard = require("alpha.themes.dashboard")
  local icons = require("plugins.icons")

  -- Helper function to create buttons with consistent styling
  local function button(shortcut, text, command, opts)
    local b = dashboard.button(shortcut, text, command, opts)
    b.opts.hl_shortcut = "Include"
    return b
  end

  -- Header (ASCII Art)
  dashboard.section.header.val = {
    [[███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
    [[████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
    [[██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
    [[██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
    [[██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
    [[╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
  }

  -- Buttons
  dashboard.section.buttons.val = {
    button("f", icons.ui.Files .. " Find file", ":Telescope find_files <CR>"),
    button("n", icons.ui.NewFile .. " New file", ":ene <BAR> startinsert <CR>"),
    button("p", icons.git.Repo .. " Find project", ":lua require('telescope').extensions.projects.projects()<CR>"),
    button("r", icons.ui.History .. " Recent files", ":Telescope oldfiles <CR>"),
    button("t", icons.ui.Text .. " Find text", ":Telescope live_grep <CR>"),
    button("c", icons.ui.Gear .. " Config", ":e ~/.config/nvim/init.lua <CR>"),
    button("q", icons.ui.SignOut .. " Quit", ":qa<CR>"),
  }

  -- Footer
  local function footer()
    return "chrisatmachine.com"
  end
  dashboard.section.footer.val = footer()

  -- Highlighting
  dashboard.section.header.opts.hl = "Keyword"
  dashboard.section.buttons.opts.hl = "Include"
  dashboard.section.footer.opts.hl = "Type"

  -- Disable autocmd during setup
  dashboard.opts.opts.noautocmd = true
  alpha.setup(dashboard.opts)

  -- Update footer with plugin stats after LazyVim loads
  vim.api.nvim_create_autocmd("User", {
    pattern = "LazyVimStarted",
    callback = function()
      local stats = require("lazy").stats()
      local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
      dashboard.section.footer.val = "Loaded " .. stats.count .. " plugins in " .. ms .. "ms"
      pcall(vim.cmd.AlphaRedraw)
    end,
  })

  -- Hide statusline while Alpha is open
  vim.api.nvim_create_autocmd("User", {
    pattern = "AlphaReady",
    callback = function()
      vim.cmd([[
        set laststatus=0
        autocmd BufUnload <buffer> set laststatus=3
      ]])
    end,
  })
end

return M
