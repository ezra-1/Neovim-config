local M = {
  "Pocco81/auto-save.nvim",
  event = "VeryLazy",
}

function M.config()
  local ok, autosave = pcall(require, "auto-save")
  if not ok then
    vim.notify("auto-save.nvim not found!", vim.log.levels.ERROR)
    return
  end

  autosave.setup({
    enabled = true, -- start automatically
    trigger_events = { "InsertLeave", "TextChanged" },
    condition = function(buf)
      -- only save modifiable buffers
      return vim.fn.getbufvar(buf, "&modifiable") == 1
    end,
    write_all_buffers = false, -- save only current buffer
    debounce_delay = 300,      -- 300ms delay between saves
  })

  -- optional toggle keymap
  vim.keymap.set("n", "<leader>sa", "<cmd>ASToggle<CR>", { desc = "Toggle AutoSave" })
end

return M
