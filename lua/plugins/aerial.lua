return {
  {
    "stevearc/aerial.nvim",
    branch = "nvim-0.11",
    opts = {
      -- treesitter shows immediately; aerial upgrades to lsp once vue_ls finishes initializing
      backends = { "lsp", "treesitter", "markdown", "man" },

      manage_folds = false,
      filter_kind = false,
    },
  },
}
