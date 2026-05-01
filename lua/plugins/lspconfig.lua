local M = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "folke/neodev.nvim",
  },
}

-- =========================
-- KEYMAPS (buffer-local)
-- =========================
local function lsp_keymaps(bufnr)
  local opts = { buffer = bufnr, silent = true }

  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
end

-- =========================
-- ON ATTACH
-- =========================
M.on_attach = function(client, bufnr)
  lsp_keymaps(bufnr)

  if client:supports_method("textDocument/inlayHint") then
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  end
end

-- =========================
-- CAPABILITIES
-- =========================
function M.common_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  return capabilities
end

-- =========================
-- CONFIG
-- =========================
function M.config()
  local wk = require("which-key")
  local icons = require("ui.icons")

  -- =========================
  -- WHICH-KEY MAPS
  -- =========================
  wk.add({
    { "<leader>l", group = "LSP" },

    { "<leader>la", vim.lsp.buf.code_action, desc = "Code Action" },
    { "<leader>laa", vim.lsp.buf.code_action, desc = "Code Action (Visual)", mode = "v" },

    {
      "<leader>lf",
      function()
        vim.lsp.buf.format({
          async = true,
          filter = function(client)
            return client.name ~= "typescript-tools"
          end,
        })
      end,
      desc = "Format",
    },

    {
      "<leader>lh",
      function()
        vim.diagnostic.open_float({
          severity = vim.diagnostic.severity.HINT,
        })
      end,
      desc = "Hints",
    },

    { "<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },

    {
      "<leader>lj",
      function()
        vim.diagnostic.jump({ count = 1, float = true })
      end,
      desc = "Next Diagnostic",
    },

    {
      "<leader>lk",
      function()
        vim.diagnostic.jump({ count = -1, float = true })
      end,
      desc = "Prev Diagnostic",
    },

    { "<leader>ll", vim.lsp.codelens.run, desc = "CodeLens Action" },
    { "<leader>lq", vim.diagnostic.setloclist, desc = "Quickfix" },
    { "<leader>lr", vim.lsp.buf.rename, desc = "Rename" },
  })

  -- =========================
  -- DIAGNOSTICS CONFIG
  -- =========================
  vim.diagnostic.config({
    virtual_text = false,
    underline = true,
    update_in_insert = false,
    severity_sort = true,

    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = icons.diagnostics.Error,
        [vim.diagnostic.severity.WARN]  = icons.diagnostics.Warning,
        [vim.diagnostic.severity.INFO]  = icons.diagnostics.Information,
        [vim.diagnostic.severity.HINT]  = icons.diagnostics.Hint,
      },
    },

    float = {
      border = "rounded",
      source = "if_many",
    },
  })

  -- =========================
  -- LSP UI
  -- =========================
  require("lspconfig.ui.windows").default_options.border = "rounded"

  -- =========================
  -- SERVERS
  -- =========================
  local servers = {
    "lua_ls",
    "cssls",
    "html",
    "ts_ls",
    "eslint",
    "pyright",
    "bashls",
    "jsonls",
    "yamlls",
  }

  for _, server in ipairs(servers) do
    local opts = {
      on_attach = M.on_attach,
      capabilities = M.common_capabilities(),
    }

    local ok, settings = pcall(require, "plugins.lspsettings." .. server)
    if ok then
      opts = vim.tbl_deep_extend("force", settings, opts)
    end

    if server == "lua_ls" then
      require("neodev").setup({})
    end

    vim.lsp.config(server, opts)
    vim.lsp.enable(server)
  end
end

return M
