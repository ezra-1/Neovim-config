local M = {
  "xiyaowong/transparent.nvim",
}

function M.config()
   -- Optional, you don't have to run setup.
require("transparent").setup({
  -- table: default groups
  groups = {
    'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
    'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
    'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
    'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
    'EndOfBuffer',
  },
  -- table: additional groups that should be cleared
  extra_groups = {
     -- Floating windows
    "NormalFloat",
    -- "FloatBorder",

    -- cmp menu
    -- "CmpPmenu",
    -- "CmpPmenuSel",
    -- "CmpPmenuBorder",
    -- "CmpDoc",
    -- "CmpDocBorder",
    --
    -- Pmenu fallback
    -- "Pmenu",
    -- "PmenuSel",
    -- "PmenuSbar",
    -- "PmenuThumb",
    },
  -- table: groups you don't want to clear
  exclude_groups = {},
  -- function: code to be executed after highlight groups are cleared
  -- Also the user event "TransparentClear" will be triggered
  on_clear = function() end,
})
end

return M
