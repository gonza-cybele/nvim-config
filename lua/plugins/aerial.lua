return {
  {
    "stevearc/aerial.nvim",
    opts = function(_, opts)
      -- 1. Ensure Variable is included in the filter.
      -- This allows "const someFunction = () => {}" to be picked up.
      if opts.filter_kind then
        table.insert(opts.filter_kind, "Variable")
      else
        opts.filter_kind = { "Class", "Function", "Method", "Variable" }
      end

      opts.backends = { "lsp", "treesitter", "markdown", "man" }

      -- 3. Optional: Customize the appearance
      opts.layout = {
        min_width = 40,
        default_direction = "right",
      }
    end,
  },
}
