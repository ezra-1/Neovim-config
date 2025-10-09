local M = {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-treesitter/nvim-treesitter",
    -- general tests
    "vim-test/vim-test",
    "nvim-neotest/neotest-vim-test",
    -- language specific tests
    "marilari88/neotest-vitest",
    "nvim-neotest/neotest-python",
    "nvim-neotest/neotest-plenary",
    "rouge8/neotest-rust",
    "lawrence-laz/neotest-zig",
    "rcasia/neotest-bash",
    "nvim-neotest/neotest-jest",
  },
}

function M.config()
  local wk = require "which-key"
  wk.add {
    { "<leader>tt", "<cmd>lua require'neotest'.run.run()<cr>", desc = "Test Nearest" },
    { "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", desc = "Test File" },
    { "<leader>td", "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", desc = "Debug Test" },
    { "<leader>ts", "<cmd>lua require('neotest').run.stop()<cr>", desc = "Test Stop" },
    { "<leader>ta", "<cmd>lua require('neotest').run.attach()<cr>", desc = "Attach Test" },
    { "<leader>to", "<cmd>lua require('neotest').summary.toggle()<cr>", desc = "Toggle Test Summary" },
  }

  ---@diagnostic disable: missing-fields
  require("neotest").setup {
    adapters = {
      require("neotest-python") {
        dap = { justMyCode = false },
      },
      require("neotest-vitest") {
        vitestCommand = "npx vitest",
        filterDir = function(name)
          return name ~= "node_modules"
        end,
      },
      require("neotest-jest") {
        jestCommand = "npm test --",
        jestConfigFile = "jest.config.ts",
        env = { CI = true },
        cwd = function() return vim.fn.getcwd() end,
      },
      require("neotest-zig"),
      require("neotest-rust"),
      require("neotest-plenary"),
      require("neotest-bash"),
      require("neotest-vim-test") {
        ignore_file_types = { "python", "vim", "lua", "javascript", "typescript" },
      },
    },
    icons = {
      running = "",
      passed = "",
      failed = "",
      skipped = "",
    },
    output = { open_on_run = true },
  }
end

return M
