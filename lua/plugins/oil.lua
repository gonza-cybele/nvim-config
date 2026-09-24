return {
  "stevearc/oil.nvim",
  lazy = false, -- Force loading on startup
  opts = {
    view_options = {
      show_hidden = true,
    },
  },
  -- Optional: ensure icons show up if you have a nerd font
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "-", "<cmd>Oil<cr>", desc = "Open Parent Directory" },
  },
}
