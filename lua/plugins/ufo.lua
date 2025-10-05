local M = {
  "kevinhwang91/nvim-ufo",
  dependencies = { "kevinhwang91/promise-async", "luukvbaal/statuscol.nvim" },
  event = "BufReadPost",
}

function M.config()
  local function setup_ufo()
    local builtin = require("statuscol.builtin")

    ---------------------------------------------------------------------------
    -- 🧱 Status Column Setup
    ---------------------------------------------------------------------------
    require("statuscol").setup({
      setopt = true,
      relculright = true,
      segments = {
        { text = { builtin.foldfunc, " " }, click = "v:lua.ScFa", hl = "Comment" },
        { text = { "%s" }, click = "v:lua.ScSa" },
        { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
      },
    })

    ---------------------------------------------------------------------------
    -- 🧩 Folding Options
    ---------------------------------------------------------------------------
    vim.o.foldcolumn = "1"
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
    vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

    ---------------------------------------------------------------------------
    -- 🪶 Custom Fold Virtual Text Handler
    ---------------------------------------------------------------------------
    local handler = function(virtText, lnum, endLnum, width, truncate)
      local newVirtText = {}
      local suffix = (" 󰡏 %d "):format(endLnum - lnum)
      local sufWidth = vim.fn.strdisplaywidth(suffix)
      local targetWidth = width - sufWidth
      local curWidth = 0

      for _, chunk in ipairs(virtText) do
        local chunkText, chunkWidth = chunk[1], vim.fn.strdisplaywidth(chunk[1])
        if targetWidth > curWidth + chunkWidth then
          table.insert(newVirtText, chunk)
        else
          chunkText = truncate(chunkText, targetWidth - curWidth)
          table.insert(newVirtText, { chunkText, chunk[2] })
          if curWidth + vim.fn.strdisplaywidth(chunkText) < targetWidth then
            suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
          end
          break
        end
        curWidth = curWidth + chunkWidth
      end

      table.insert(newVirtText, { suffix, "MoreMsg" })
      return newVirtText
    end

    ---------------------------------------------------------------------------
    -- 🧠 UFO Setup
    ---------------------------------------------------------------------------
    require("ufo").setup({
      fold_virt_text_handler = handler,
      close_fold_kinds = {},
      provider_selector = function(_, filetype, _)
        local ok, parsers = pcall(require, "nvim-treesitter.parsers")
        if ok and parsers.has_parser(filetype) then
          return { "treesitter", "indent" }
        else
          return { "indent" }
        end
      end,
      preview = {
        win_config = {
          border = { "", "─", "", "", "", "─", "", "" },
          winhighlight = "Normal:Folded",
          winblend = 0,
        },
      },
    })

    ---------------------------------------------------------------------------
    -- 🗝️ Keymaps
    ---------------------------------------------------------------------------
    vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" })
    vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds" })
    vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds, { desc = "Open folds except kinds" })
    vim.keymap.set("n", "zm", require("ufo").closeFoldsWith, { desc = "Close folds with level" })
    vim.keymap.set("n", "K", function()
      local winid = require("ufo").peekFoldedLinesUnderCursor()
      if not winid then
        vim.lsp.buf.hover()
      end
    end, { desc = "Peek fold or hover" })
  end

  ---------------------------------------------------------------------------
  -- 💤 Defer setup until dashboard is closed (Alpha or Snacks)
  ---------------------------------------------------------------------------
  vim.api.nvim_create_autocmd("User", {
    pattern = { "AlphaClosed", "SnacksDashboardClosed" },
    callback = function()
      vim.schedule(setup_ufo)
    end,
  })
end

return M

