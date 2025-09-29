local M = {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
}

function M.config()
  local notify = require("notify")
  notify.setup {
    stages = "fade_in_slide_out",
    timeout = 3000,
    background_colour = "#000000",
    fps = 60,
    render = "default",
    top_down = true,
  }

  -- Show notification on file save
  vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*",
    callback = function(args)
      local fname = vim.fn.expand("<afile>")
      vim.notify("Saved: " .. fname, "info", { title = "💾 Save" })
    end,
  })
end

return M


