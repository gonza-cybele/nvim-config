-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local fnm_bin = vim.fn.expand("~/.local/share/fnm/aliases/default/bin")
if vim.fn.isdirectory(fnm_bin) == 1 then
  vim.env.PATH = fnm_bin .. ":" .. vim.env.PATH
end

local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"
if vim.fn.isdirectory(mason_bin) == 1 then
  vim.env.PATH = mason_bin .. ":" .. vim.env.PATH
end

for _, go_bin in ipairs({ vim.fn.expand("~/.local/go/bin"), vim.fn.expand("~/go/bin") }) do
  if vim.fn.isdirectory(go_bin) == 1 then
    vim.env.PATH = go_bin .. ":" .. vim.env.PATH
  end
end

-- Use win32yank.exe to bridge WSL <-> Windows clipboard (xclip only talks to WSLg X server)
vim.g.clipboard = {
  name = "win32yank",
  copy = {
    ["+"] = "win32yank.exe -i --crlf",
    ["*"] = "win32yank.exe -i --crlf",
  },
  paste = {
    ["+"] = "win32yank.exe -o --lf",
    ["*"] = "win32yank.exe -o --lf",
  },
  cache_enabled = 0,
}

-- Line wrapping / break-indent behavior
-- Enable break indent
vim.o.breakindent = true
-- Add a "padding" of 1 space to wrapped lines
vim.opt.breakindentopt = "sbr"
-- Optional: Add a character at the start of the wrapped line
vim.opt.showbreak = "↳ "
vim.opt.wrapmargin = 2 -- Wraps 2 characters before the right edge
-- Enable line wrapping (LazyVim disables it by default)
vim.opt.wrap = true
