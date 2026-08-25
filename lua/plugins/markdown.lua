-- Globally disable markdownlint rules (e.g. MD013 line-length) for ALL markdown
-- files, independent of the current project.
--
-- The real rules live in .markdownlint.yaml at the root of this nvim config repo
-- (version-controlled). ~/.markdownlint.yaml is a two-line stub that `extends` it.
--
-- Why this shape: markdownlint-cli2 v0.22.1's `--config` flag does NOT apply in this
-- install, so we rely on its config auto-discovery instead:
--   * nvim-lint runs `markdownlint-cli2 -` over STDIN, which only reads a config from
--     the process's cwd (it does not walk parent dirs). So we pin the linter's cwd to
--     $HOME, where the stub lives  ->  rules apply everywhere.
--   * conform's `--fix` runs on the real file and DOES walk up the dir tree, so it finds
--     the stub on its own (no override needed) for any file under $HOME.
return {
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters = {
        ["markdownlint-cli2"] = {
          cwd = vim.fn.expand("~"),
        },
      },
    },
  },
}
