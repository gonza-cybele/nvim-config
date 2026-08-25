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
      inlay_hints = { enabled = false },
      servers = {
        gopls = {},
      },
    },
  },
}
