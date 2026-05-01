local M = {
  "nvim-treesitter/nvim-treesitter",
  lazy = false, -- MUST be loaded eagerly
  build = ":TSUpdate",
}

function M.config()
  require('nvim-treesitter').install { 'rust', 'javascript', "typescript", 'zig', "lua", "tsx", "java" }
end

return M
