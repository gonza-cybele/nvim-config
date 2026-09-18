-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Move the current buffer in the bufferline
map("n", "<leader>bH", "<cmd>BufferLineMovePrev<cr>", { desc = "Move Buffer Left" })
map("n", "<leader>bL", "<cmd>BufferLineMoveNext<cr>", { desc = "Move Buffer Right" })
