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
      -- 🧹 Formatting
      formatting.stylua,
      formatting.prettier,
      formatting.black,
      formatting.isort,

      -- 🔍 Diagnostics
      -- diagnostics.flake8,
      diagnostics.mypy,
      -- diagnostics.luacheck,

      -- 💡 Code Actions
      code_actions.gitsigns,

      -- ✍️ Completion
      completion.spell,
    },
  })
end

return M
