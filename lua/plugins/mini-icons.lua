local M = {
  "echasnovski/mini.icons",
  version = false, -- use latest
  event = "VeryLazy",
}

function M.config()
  require("mini.icons").setup()
end

return M
