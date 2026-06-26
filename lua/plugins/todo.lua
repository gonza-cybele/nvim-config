return {
  {
    "freitass/todo.txt-vim",
    init = function()
      vim.filetype.add({
        pattern = {
          -- name starts with "todo" and ends in .txt (todo.txt, todo.work.txt, ...)
          ["todo[^/\\]*%.txt"] = "todo",
          [".*[/\\]todo[^/\\]*%.txt"] = "todo",
          -- *to-do.txt
          [".*to%-do%.txt"] = "todo",
          -- meetings.txt anywhere
          ["meetings%.txt"] = "todo",
          [".*[/\\]meetings%.txt"] = "todo",
        },
      })
    end,
  },
}
