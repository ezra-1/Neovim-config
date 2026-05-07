local M = {
  "mfussenegger/nvim-jdtls",
  ft = "java",
}

vim.lsp.config("jdtls", {
  cmd = {
    "jdtls",
    "-data",
    vim.fn.stdpath("cache") .. "/jdtls-workspace",
  },

  root_dir = function(fname)
    return vim.fs.root(fname, {
      "gradlew",
      "mvnw",
      ".git",
      "pom.xml",
      "build.gradle",
    })
  end,

  settings = {
    java = {},
  },
})

vim.lsp.enable("jdtls")

return M
