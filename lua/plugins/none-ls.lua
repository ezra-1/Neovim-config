local M = {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}

function M.config()
  local null_ls = require("null-ls")

  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics
  local code_actions = null_ls.builtins.code_actions
  local completion = null_ls.builtins.completion

  null_ls.setup({
    debug = true,
    sources = {
      -- =========================
      -- 🧹 FORMATTERS
      -- =========================

      -- Lua formatter
      formatting.stylua,

      -- Web formatter (JS/TS/HTML/CSS)
      formatting.prettier,

      -- Python formatting
      formatting.black,
      formatting.isort,

      -- Nix formatter (choose ONE)
      formatting.alejandra, -- recommended (modern nix formatter)
      -- formatting.nixfmt,  -- simpler alternative

      -- Shell script formatter
      formatting.shfmt, -- formats bash/sh scripts

      -- =========================
      -- 🔍 DIAGNOSTICS (linting)
      -- =========================

      -- Python type checking
      diagnostics.mypy,

      -- =========================
      -- 💡 CODE ACTIONS
      -- =========================

      code_actions.gitsigns,

      -- =========================
      -- ✍️ COMPLETIONS
      -- =========================

      completion.spell,
    },
  })

  -- =========================
  -- ⚡ AUTO FORMAT ON SAVE
  -- =========================
  --
  -- This triggers formatting before saving a file.
  -- Uses LSP/none-ls attached formatters.

  -- vim.api.nvim_create_autocmd("BufWritePre", {
  --   callback = function(args)
  --     vim.lsp.buf.format({
  --       bufnr = args.buf,
  --       async = false,
  --     })
  --   end,
  -- })
end

return M
