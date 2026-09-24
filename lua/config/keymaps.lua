-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Move the current buffer in the bufferline
map("n", "<leader>bH", "<cmd>BufferLineMovePrev<cr>", { desc = "Move Buffer Left" })
map("n", "<leader>bL", "<cmd>BufferLineMoveNext<cr>", { desc = "Move Buffer Right" })

-- Save the current buffer without running the LazyVim formatter.
-- Other BufWritePre autocmds still run.
map("n", "<leader>W", function()
  local prev = vim.b.autoformat
  vim.b.autoformat = false
  vim.cmd("write")
  vim.b.autoformat = prev
end, { desc = "Save Without Formatting" })

-- Format only the visual selection with prettier and ignore .prettierignore.
-- Visual mode only: conform takes the range from the selection.
map("x", "<leader>cI", function()
  require("conform").format({
    formatters = { "prettier_noignore" },
    lsp_format = "never",
    async = true,
  }, function(err)
    if err then
      vim.notify(err, vim.log.levels.WARN)
    end
  end)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
end, { desc = "Format Selection (Ignore .prettierignore)" })
