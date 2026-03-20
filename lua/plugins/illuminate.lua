local M = {
  "RRethy/vim-illuminate",
  event = "VeryLazy",
}

function M.config()
  require("illuminate").configure {
    filetypes_denylist = {
      "mason",
      "harpoon",
      "NeogitCommitMessage",
      "qf",
      "dirvish",
      "oil",
      "snacks",
      "fugitive",
      "lazy",
      "NeogitStatus",
      "netrw",
      "lir",
      "DiffviewFiles",
      "Outline",
      "Jaq",
      "spectre_panel",
      "TelescopePrompt",
    },
  }
end

return M
