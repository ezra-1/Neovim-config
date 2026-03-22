local M = {
  "olimorris/codecompanion.nvim",
  event = "VeryLazy",
  dependencies = {
    "ravitemer/mcphub.nvim",
  },
}

function M.config()
  require("codecompanion").setup({
    strategies = {
      chat = {
        adapter = "copilot",
      },
      inline = {
        adapter = "copilot",
      },
    },
    adapters = {
      copilot = function()
        return require("codecompanion.adapters").extend("copilot", {
          schema = {
            model = {
              default = "gpt-4o",
            },
          },
        })
      end,
    },
    extensions = {
      mcphub = {
        callback = "mcphub.extensions.codecompanion",
        opts = {
          make_vars = true,
          make_slash_commands = true,
          show_result_in_chat = true,
        },
      },
    },
  })

  vim.api.nvim_create_autocmd("FileType", {
    pattern = "codecompanion",
    callback = function()
      vim.opt_local.number = false
      vim.opt_local.relativenumber = false
      vim.opt_local.signcolumn = "no"
      vim.opt_local.foldcolumn = "0"
    end,
  })

  vim.keymap.set("n", "<leader>cc", "<cmd>CodeCompanionChat<cr>")
end

return M
