-- Neovim Options

local opt = vim.opt
local g = vim.g

-- File handling
opt.backup = false
opt.swapfile = false
opt.writebackup = false
opt.undofile = true -- persistent undo

-- UI
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

-- Command line / messages
opt.cmdheight = 0 -- auto-hide cmdline (needs Neovim 0.9+)
opt.showcmd = false
opt.ruler = false
opt.shortmess:append "c"

-- Search
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Completion / menus
opt.completeopt = { "menuone", "noselect" }
opt.pumheight = 10
opt.pumblend = 10

-- Indentation
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true

-- Splits
opt.splitbelow = true
opt.splitright = true

-- Performance
opt.timeoutlen = 1000
opt.updatetime = 100

-- Scrolling
opt.scrolloff = 4 -- keep some context around cursor
opt.sidescrolloff = 8

-- Mouse / clipboard
opt.mouse = "a"
opt.clipboard = "unnamedplus"

-- Fonts (for GUI clients)
opt.guifont = "JetBrains Mono:h17"

-- Keywords
opt.iskeyword:append("-")

-- Wrapping
opt.whichwrap:append "<,>,[,],h,l"

-- Netrw (if you use it)
g.netrw_banner = 0
g.netrw_mouse = 2

