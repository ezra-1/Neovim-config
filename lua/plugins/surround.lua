local M = {
  "kylechui/nvim-surround",
  version = "*",
  event = "VeryLazy",
}

function M.config()
  require("nvim-surround").setup({
    keymaps = {
      normal = "ys",
      normal_cur = "yss",
      delete = "ds",
      change = "cs",
      visual = "S",
    },
    surrounds = {
      -- Custom surround for HTML/JSX tags
      ["t"] = {
        add = function()
          local tag = vim.fn.input("Enter tag: ")
          return { { "<" .. tag .. ">" }, { "</" .. tag .. ">" } }
        end,
        find = function()
          return require("nvim-surround.config").get_selection({ motion = "at" })
        end,
        delete = "^(%b<>)().-(%b<>)()$",
      },
    },
  })
end

return M

