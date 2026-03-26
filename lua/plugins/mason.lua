local M = {
  "mason-org/mason-lspconfig.nvim",
  dependencies = {
    "mason-org/mason.nvim",
    "jay-babu/mason-nvim-dap.nvim",
  },
}

function M.config()
  local servers = {
    "lua_ls",
    "cssls",
    "html",
    "ts_ls",
    "pyright",
    "bashls",
    "jsonls",
  }

  local dap_servers = {
    "js",
  }

  require("mason").setup {
    ui = {
      border = "rounded",
    },
  }

  require("mason-nvim-dap").setup({
    ensure_installed = { "js" },
    automatic_installation = true,
  })



  require("mason-lspconfig").setup {
    ensure_installed = servers,
  }
end

return M
