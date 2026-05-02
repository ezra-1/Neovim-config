local M = {
  "mfussenegger/nvim-dap",
  event = "VeryLazy",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "jay-babu/mason-nvim-dap.nvim",
  },
}

function M.config()
  local dap = require("dap")
  local dapui = require("dapui")
  local cwd = vim.fn.getcwd()

  -- =========================
  -- BREAKPOINT SIGNS
  -- =========================
  vim.fn.sign_define("DapBreakpoint", {
    text = "",
    texthl = "DiagnosticError",
  })

  vim.fn.sign_define("DapBreakpointCondition", {
    text = "ﳁ",
    texthl = "DiagnosticWarn",
  })

  vim.fn.sign_define("DapStopped", {
    text = "",
    texthl = "DiagnosticInfo",
    linehl = "Visual",
  })

  local dap_servers = {
    "js",
    "javadbg"
  }

  -- =========================
  -- MASON DAP
  -- =========================
  require("mason-nvim-dap").setup({
    ensure_installed = dap_servers,
    automatic_installation = true,
  })

  -- =========================
  -- UI
  -- =========================
  dapui.setup({
    layouts = {
      {
        elements = {
          { id = "scopes", size = 0.25 },
          { id = "breakpoints", size = 0.25 },
          { id = "stacks", size = 0.25 },
          { id = "watches", size = 0.25 },
        },
        size = 40,
        position = "left",
      },
      {
        elements = {
          { id = "repl", size = 0.5 },
          { id = "console", size = 0.5 },
        },
        size = 0.25,
        position = "bottom",
      },
    },
  })

  -- auto open/close UI
  dap.listeners.after.event_initialized["dapui"] = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated["dapui"] = function()
    dapui.close()
  end
  dap.listeners.before.event_exited["dapui"] = function()
    dapui.close()
  end

  -- =========================
  -- ADAPTER
  -- =========================
  local js_debug_path =
    vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js"

  dap.adapters["pwa-node"] = function(cb)
    cb({
      type = "server",
      host = "localhost",
      port = "${port}",
      executable = {
        command = "node",
        args = { js_debug_path, "${port}" },
      },
    })
  end

  -- =========================
  -- CONFIGS
  -- =========================
  local base = {
    type = "pwa-node",
    cwd = cwd,
    sourceMaps = true,
    protocol = "inspector",
    console = "integratedTerminal",
    skipFiles = { "<node_internals>/**", "node_modules/**" },
  }

  local configs = {
    vim.tbl_extend("force", base, {
      name = "Launch file",
      request = "launch",
      program = "${file}",
    }),
    vim.tbl_extend("force", base, {
      name = "Attach to process",
      request = "attach",
      processId = require("dap.utils").pick_process,
    }),
    vim.tbl_extend("force", base, {
      name = "Debug Jest",
      request = "launch",
      runtimeExecutable = "node",
      runtimeArgs = {
        "./node_modules/jest/bin/jest.js",
        "--runInBand",
      },
      internalConsoleOptions = "neverOpen",
    }),
  }

  for _, ft in ipairs({
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
  }) do
    dap.configurations[ft] = configs
  end

  -- =========================
  -- KEYMAPS
  -- =========================
  local map = vim.keymap.set

  map("n", "<F5>", dap.continue, { desc = "Continue" })
  map("n", "<F10>", dap.step_over, { desc = "Step Over" })
  map("n", "<F11>", dap.step_into, { desc = "Step Into" })
  map("n", "<F12>", dap.step_out, { desc = "Step Out" })

  map("n", "<leader>b", dap.toggle_breakpoint, { desc = "Breakpoint" })
  map("n", "<leader>B", function()
    dap.set_breakpoint(vim.fn.input("Condition: "))
  end, { desc = "Conditional Breakpoint" })

  map("n", "<leader>dr", dap.repl.open, { desc = "REPL" })
  map("n", "<leader>dl", dap.run_last, { desc = "Run Last" })
  map("n", "<leader>du", dapui.toggle, { desc = "Toggle UI" })
end

return M
