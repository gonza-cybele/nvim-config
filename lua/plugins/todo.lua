return {
  {
    "freitass/todo.txt-vim",
    init = function()
      vim.filetype.add({
        pattern = {
          [".*todo%.txt"] = "todo",
          [".*to%-do%.txt"] = "todo",
        },
      })
    end,
  },
}
