return {
  'rcarriga/nvim-dap-ui',
  dependencies = {
    'mfussenegger/nvim-dap',
    'nvim-neotest/nvim-nio'
  },
  keys = {
    { '<leader>dt', "<Cmd>lua require('dapui').toggle() <CR>", desc = "Toggle debug UI" },
    { '<leader>do', "<Cmd>lua require('dapui').open() <CR>",   desc = "Open debug UI" },
    { '<leader>dc', "<Cmd>lua require('dapui').close() <CR>",  desc = "Close debug UI" },
  },
  config = function()
    local dapui = require 'dapui'
    local dap = require 'dap'

    dapui.setup()

    local listeners = dap.listeners.before

    listeners.attach.dapui_config = dapui.open
    listeners.launch.dapui_config = dapui.open
    listeners.event_terminated.dapui_config = dapui.close
    listeners.event_exited.dapui_config = dapui.close
  end
}
