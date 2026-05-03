local M = {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async",
  },
  event = "VeryLazy",
}

function M.config()
  -- Global fold settings (required for ufo to work properly)
  vim.o.foldcolumn = "1" -- Show fold column
  vim.o.foldlevel = 99   -- Start with all folds open
  vim.o.foldlevelstart = 99
  vim.o.foldenable = true

  -- Optional: minimal setup with default providers
  require("ufo").setup({
    provider_selector = function(bufnr, filetype, buftype)
      if filetype == "snacks_dashboard" then
        return ""
      end
      return { "treesitter", "indent" }
    end,
  })

  -- Optional keymaps
  local opts = { noremap = true, silent = true }
  vim.keymap.set("n", "zR", require("ufo").openAllFolds, opts)
  vim.keymap.set("n", "zM", require("ufo").closeAllFolds, opts)
  vim.keymap.set("n", "zU", require("ufo").peekFoldedLinesUnderCursor, opts)
end

return M
