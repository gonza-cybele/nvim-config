return {
  "folke/zen-mode.nvim",
  cmd = "ZenMode",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    window = {
      backdrop = 1, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
      width = 120, -- width of the Zen window
      height = 1, -- height of the Zen window
    },
    plugins = {
      -- disable some global components when zen mode is on
      options = {
        enabled = true,
        ruler = false, -- disables the ruler text in the status line
        showcmd = false, -- disables the command in the last line of the screen
      },
      twilight = { enabled = true }, -- enable twilight when zen mode is on
      gitsigns = { enabled = false }, -- disables git signs
      tmux = { enabled = false }, -- disables the tmux statusline
      wrap = true,
    },
  },
  keys = {
    { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" },
  },
}
