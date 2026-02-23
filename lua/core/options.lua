-- Neovim Options

vim.g.python3_host_prog = vim.fn.expand("~/.venvs/nvim/bin/python3")

local opt = vim.opt
local g = vim.g

-- file handling
opt.backup = false
opt.swapfile = false
opt.writebackup = false
opt.undofile = true -- persistent undo

-- ui
opt.termguicolors = true
opt.signcolumn = "yes:1" -- always show, but only 1 column
opt.cursorline = true
opt.number = true
opt.relativenumber = true
opt.numberwidth = 4
opt.laststatus = 3 -- global statusline
opt.showmode = false
opt.showtabline = 1
opt.title = false
opt.wrap = false
opt.colorcolumn = "" -- you can set "80" or "120" if you want
opt.fillchars:append { eob = " ", stl = " " }

-- command line / messages
opt.cmdheight = 0 -- auto-hide cmdline (needs neovim 0.9+)
opt.showcmd = false
opt.ruler = false
opt.shortmess:append "c"

-- search
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true

-- completion / menus
opt.completeopt = { "menuone", "noselect" }
opt.pumheight = 10
opt.pumblend = 10

-- indentation
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true

-- splits
opt.splitbelow = true
opt.splitright = true

-- performance
opt.timeoutlen = 1000
opt.updatetime = 100

-- scrolling
opt.scrolloff = 4 -- keep some context around cursor
opt.sidescrolloff = 8

-- mouse / clipboard
opt.mouse = "a"
opt.clipboard = "unnamedplus"

-- fonts (for gui clients)
opt.guifont = "jetbrains mono:h17"

-- keywords
opt.iskeyword:append("-")

-- wrapping
opt.whichwrap:append "<,>,[,],h,l"


-- netrw (if you use it)
g.netrw_banner = 0
g.netrw_mouse = 2

-- Neovide config
if vim.g.neovide then
  -- Font
  vim.o.guifont = "Cascadia Code"

  -- Line spacing
  vim.opt.linespace = 2

  -- Scale
  vim.g.neovide_scale_factor = 0.8

  -- Refresh Rate
  vim.g.neovide_refresh_rate = 60

  -- Idle Refresh Rate
  vim.g.neovide_refresh_rate_idle = 5

  -- Theme
  vim.g.neovide_theme = 'auto'

  -- Animate cursor
  vim.g.neovide_cursor_vfx_mode = "torpedo"

  -- Transparency
  vim.g.neovide_opacity = 0.8
  vim.g.neovide_normal_opacity = 0.8
end
