local M = {
  "nvim-tree/nvim-web-devicons",
  event = "VeryLazy",
}

function M.config()
  require("nvim-web-devicons").setup({
    default = true,
  })
end

return M
