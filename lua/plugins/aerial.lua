return {
  {
    "stevearc/aerial.nvim",
    branch = "nvim-0.11",
    opts = {
      -- treesitter shows immediately; aerial upgrades to lsp once vue_ls finishes initializing
      backends = { "lsp", "treesitter", "markdown", "man" },

      manage_folds = false,
      filter_kind = false,
      -- Set initial collapse level when symbols are first loaded
      -- on_first_symbols = function(bufnr)
      --   -- level 0 = all collapsed
      --   -- level 1 = top level open, children collapsed
      --   -- level 2 = two levels open, etc.
      --   -- level 99 = everything open
      --   require("aerial").tree_set_collapse_level(bufnr, 1)
      -- end,
    },
  },
}
