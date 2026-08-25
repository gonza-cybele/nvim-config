return {
  -- Your active or default theme
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "kanagawa",
      -- colorscheme = "retrobox",
      -- colorscheme = "yugen",
      -- colorscheme = "koda-dark",
      colorscheme = "koda-moss",
    },
  },
  -- Additional themes for your picker
  -- { "folke/tokyonight.nvim", lazy = true },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "ellisonleao/gruvbox.nvim", lazy = true },
  { "rebelot/kanagawa.nvim", lazy = true },
  { "rose-pine/neovim", name = "rose-pine", lazy = true },
  { "shaunsingh/nord.nvim", lazy = true },
  { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
  { "oskarnurm/koda.nvim", lazy = true, priority = 1000 },
  { "bettervim/yugen.nvim", name = "yugen", lazy = true },
}
