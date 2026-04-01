-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local node_path = vim.fn.exepath("node")
if node_path ~= "" then
  vim.g.node_host_prog = node_path
end
