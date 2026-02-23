-- Leader keys (must be set before mappings)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Exit insert mode
keymap("i", "jk", "<esc>", opts)

-- Disable <Space> default mapping
keymap("", "<Space>", "<Nop>", opts)

-- Better window navigation with Alt
keymap("n", "<M-H>", "<C-w>h", opts)
keymap("n", "<M-J>", "<C-w>j", opts)
keymap("n", "<M-K>", "<C-w>k", opts)
keymap("n", "<M-L>", "<C-w>l", opts)
keymap("n", "<M-Tab>", "<C-6>", opts) -- switch buffers

-- Center search results
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Replace selection without yanking
keymap("x", "p", [["_dP]], opts)

keymap("n", "<RightMouse>", "<cmd>popup mousemenu<CR>", opts)
-- Optional: <Tab> to open popup menu
-- keymap("n", "<Tab>", "<cmd>popup mousemenu<CR>", opts)

-- Easier motions to line edges
keymap({ "n", "o", "x" }, "<S-h>", "^", opts)
keymap({ "n", "o", "x" }, "<S-l>", "g_", opts)

-- Better j/k with wrapped lines, but preserve counts
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap("x", "j", "gj", opts)
keymap("x", "k", "gk", opts)

-- Toggle line wrapping
keymap("n", "<leader>w", function()
  vim.wo.wrap = not vim.wo.wrap
end, opts)

-- Escape terminal mode with Ctrl-;
keymap("t", "<C-;>", [[<C-\><C-n>]], opts)

