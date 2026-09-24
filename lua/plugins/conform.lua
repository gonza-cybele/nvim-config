-- Extra conform formatters.
--
-- `prettier_noignore` is a copy of the builtin `prettier` formatter that passes an empty
-- `--ignore-path`. Prettier then formats files that a project `.prettierignore` excludes.
-- It is not in `formatters_by_ft`, so it never runs on save. Only the
-- "Format Selection (Ignore .prettierignore)" keymap in lua/config/keymaps.lua uses it.
return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
      opts.formatters = opts.formatters or {}
      opts.formatters.prettier_noignore = function()
        -- An empty ignore file. Prettier reads it instead of .prettierignore / .gitignore.
        local ignore_file = vim.fs.joinpath(vim.fn.stdpath("cache"), "prettier-empty.ignore")
        if vim.fn.filereadable(ignore_file) == 0 then
          vim.fn.writefile({}, ignore_file)
        end

        local base = vim.deepcopy(require("conform.formatters.prettier"))
        local base_args, base_range_args = base.args, base.range_args
        base.args = function(self, ctx)
          local args = base_args(self, ctx)
          return vim.list_extend(args, { "--ignore-path", ignore_file })
        end
        base.range_args = function(self, ctx)
          local args = base_range_args(self, ctx)
          return vim.list_extend(args, { "--ignore-path", ignore_file })
        end
        return base
      end
    end,
  },
}
