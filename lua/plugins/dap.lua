return {
  {
    -- skip mason-nvim-dap's delve setup: it registers duplicate "Delve: ..."
    -- configurations pointing at the dlv.cmd shim, which breaks on Windows;
    -- nvim-dap-go below handles delve instead
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      handlers = {
        delve = function() end,
      },
    },
  },
  {
    "leoluz/nvim-dap-go",
    opts = {
      delve = {
        -- nvim-dap spawns the adapter without a shell, so Mason's dlv.cmd
        -- shim on PATH can't be executed on Windows; use the real exe
        path = vim.fn.stdpath("data") .. "/mason/packages/delve/dlv.exe",
        -- delve fails to start in detached mode on Windows
        detached = vim.fn.has("win32") == 0,
      },
    },
    config = function(_, opts)
      require("dap-go").setup(opts)
      -- delve runs `go build` in its own cwd, which inherits nvim's cwd and
      -- fails with "cannot find main module" when nvim isn't sitting in the
      -- project; launch delve from the module root of the file being debugged
      local dap = require("dap")
      local go_adapter = dap.adapters.go
      dap.adapters.go = function(callback, config)
        go_adapter(function(adapter)
          if adapter.executable then
            adapter.executable.cwd = vim.fs.root(0, "go.mod") or vim.fn.getcwd()
          end
          callback(adapter)
        end, config)
      end
      -- debug the whole main module of the current file, regardless of
      -- which file is open ("Debug Package" only builds ${fileDirname},
      -- which fails from internal/ subpackages)
      table.insert(dap.configurations.go, 1, {
        type = "go",
        name = "Debug App (module root)",
        request = "launch",
        program = function()
          return vim.fs.root(0, "go.mod") or vim.fn.getcwd()
        end,
      })
    end,
  },
}
