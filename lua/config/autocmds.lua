-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Colorscheme persistence
local colorscheme_file = vim.fn.stdpath("data") .. "/colorscheme.txt"

local function load_persisted_colorscheme()
  if vim.fn.filereadable(colorscheme_file) == 1 then
    local colorscheme = vim.fn.readfile(colorscheme_file)[1]
    if colorscheme and colorscheme ~= "" then
      vim.defer_fn(function()
        local ok = pcall(vim.cmd.colorscheme, colorscheme)
        if ok then
          vim.notify("Loaded colorscheme: " .. colorscheme, vim.log.levels.INFO, { title = "Colorscheme" })
        end
      end, 100)
    end
  end
end

local function save_colorscheme()
  local colorscheme = vim.g.colors_name or vim.o.colorscheme
  if colorscheme then
    vim.fn.writefile({ colorscheme }, colorscheme_file)
  end
end

vim.api.nvim_create_autocmd({ "Colorscheme" }, {
  callback = function()
    save_colorscheme()
  end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    vim.defer_fn(load_persisted_colorscheme, 200)
  end,
})
