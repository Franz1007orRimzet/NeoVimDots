local config = {
  adapters = {
    codelldb = {
      type = 'server',
      port = '${port}',
      executable = {
        command = 'codelldb',
        args = { '--port' , '${port}'}
      }
    },
    python = {
      type = 'executable',
      command = 'python',
      args = { '-m', 'debugpy.adapter' }
    }
  },
  configurations = {
    cpp = {
      {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function ()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = require('utils.dap').take_args,
      }
    },
    python = {
      {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        pythonPath = function ()
          local python_path = vim.fn.exepath('python') or 'python3'
          return python_path
        end,
        args = require('utils.dap').take_args,
      }
    }
  }
}

config.configurations.c = config.configurations.cpp
config.configurations.rust = config.configurations.cpp

return config
