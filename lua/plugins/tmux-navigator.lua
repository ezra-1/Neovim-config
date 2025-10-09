local M = {
  "christoomey/vim-tmux-navigator",
  lazy = false,
}

function M.config()
  -- Disable auto mappings if you want to set your own keymaps
  vim.g.tmux_navigator_no_mappings = 0

  -- Allow navigation when tmux pane is zoomed
  vim.g.tmux_navigator_disable_when_zoomed = 0

  -- Prevent auto-saving before switching tmux panes
  vim.g.tmux_navigator_save_on_switch = 0
end

return M

