return {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        special = {
          spec = "require",
        },
      },

      diagnostics = {
        globals = { "vim", "spec" }, -- ✅ fixes undefined vim
      },

      workspace = {
        checkThirdParty = false,
        library = vim.api.nvim_get_runtime_file("", true), -- ✅ better than manual paths
      },

      format = {
        enable = false,
      },

      hint = {
        enable = false,
        arrayIndex = "Disable",
        await = true,
        paramName = "Disable",
        paramType = true,
        semicolon = "All",
        setType = false,
      },

      telemetry = {
        enable = false,
      },
    },
  },
}
