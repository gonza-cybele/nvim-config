return {
  {
    "mason-org/mason.nvim",
    opts = {
      PATH = "prepend",
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {},
      },
    },
  },
}
