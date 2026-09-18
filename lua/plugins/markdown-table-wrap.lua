-- Wrap wide markdown pipe tables inside each cell.
--
-- render-markdown.nvim (LazyVim lang.markdown extra) cannot reflow a table wider than
-- the window. markdown-table-wrap.nvim renders the table with wrapped cells and never
-- rewrites the source. Inline mode keeps the source buffer editable.
return {
  {
    "ice345/markdown-table-wrap.nvim",
    ft = { "markdown", "rmd" },
    opts = {
      preview_mode = "inline",
      inline_mode = "replace",
      -- "cursor" keeps the global `wrap = true` outside tables.
      -- "always" turns off wrap for the whole window while a table renders.
      inline_wrap_scope = "cursor",
      highlight_preset = "auto",
    },
    keys = {
      { "<leader>ut", "<cmd>MarkdownTableToggleInline<cr>", desc = "Toggle table wrap (inline)", ft = "markdown" },
      { "<leader>uT", "<cmd>MarkdownTableFloatPreview<cr>", desc = "Table float preview", ft = "markdown" },
    },
  },
  {
    -- The new plugin owns tables. Keep render-markdown for headings, code and lists.
    "MeanderingProgrammer/render-markdown.nvim",
    optional = true,
    opts = {
      pipe_table = { enabled = false },
    },
  },
}
