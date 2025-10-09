local M = {
  "xiyaowong/transparent.nvim",
}

function M.config()
  require("transparent").setup({
    groups = {
      "Normal",
      "NormalNC",
      "Comment",
      "Constant",
      "Special",
      "Identifier",
      "Statement",
      "PreProc",
      "Type",
      "Underlined",
      "Todo",
      "String",
      "Function",
      "Conditional",
      "Repeat",
      "Operator",
      "Structure",
      "LineNr",
      "NonText",
      "SignColumn",
      "CursorLine",
      "CursorLineNr",
      "StatusLine",
      "StatusLineNC",
      "EndOfBuffer",
    },
    extra_groups = {
      -- Floating + LSP
      "NormalFloat",
      "FloatBorder",
      "FloatTitle",
      "LspInfoBorder",
      "LspInfoNormal",
      "DiagnosticFloatingError",
      "DiagnosticFloatingWarn",
      "DiagnosticFloatingInfo",
      "DiagnosticFloatingHint",

      -- Telescope
      "TelescopeNormal",
      "TelescopeBorder",
      "TelescopePromptNormal",
      "TelescopePromptBorder",
      "TelescopeResultsNormal",
      "TelescopeResultsBorder",
      "TelescopePreviewNormal",
      "TelescopePreviewBorder",

      -- CMP popup menu
      "CmpPmenu",
      "CmpPmenuSel",
      "CmpPmenuBorder",
      "CmpDoc",
      "CmpDocBorder",

      -- Pmenu fallback
      -- "Pmenu",
      -- "PmenuSel",
      -- "PmenuSbar",
      -- "PmenuThumb",
    },
    exclude_groups = {},
  })

end

return M
