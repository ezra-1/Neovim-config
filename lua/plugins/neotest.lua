local M = {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-treesitter/nvim-treesitter",

    -- language specific
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
  local wk = require("which-key")

  wk.add({
    { "<leader>tt", function() require("neotest").run.run() end, desc = "Test Nearest" },
    { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Test File" },
    { "<leader>td", function() require("neotest").run.run({ strategy = "dap" }) end, desc = "Debug Test" },
    { "<leader>ts", function() require("neotest").run.stop() end, desc = "Stop Test" },
    { "<leader>ta", function() require("neotest").run.attach() end, desc = "Attach" },
    { "<leader>to", function() require("neotest").summary.toggle() end, desc = "Summary" },
  })

  require("neotest").setup({
    adapters = {
      require("neotest-python")({
        dap = { justMyCode = false },
      }),

      require("neotest-vitest")({
        vitestCommand = "npx vitest",
        filterDir = function(name)
          return name ~= "node_modules"
        end,
      }),

      require("neotest-jest")({
        jestCommand = "npm test --",
        jestConfigFile = "jest.config.ts",
        env = { CI = true },
        cwd = function() return vim.fn.getcwd() end,
      }),

      require("neotest-zig"),
      require("neotest-rust"),
      require("neotest-plenary"),
      require("neotest-bash"),
    },

    icons = {
      running = "",
      passed = "",
      failed = "",
      skipped = "",
    },

    output = { open_on_run = true },
  })
end

return M
