return {
  'mfussenegger/nvim-dap',
  keys = {
    { '<C-b>',      "<Cmd>lua require('dap').toggle_breakpoint() <CR>", desc = "Toggle breakpoint" },
    { '<C-d>',      "<Cmd>lua require('dap').continue() <CR>",          desc = "Continue" },
    { '<C-i>',      "<Cmd>lua require('dap').step_into() <CR>",         desc = "Step into" },
    { '<C-o>',      "<Cmd>lua require('dap').step_out() <CR>",          desc = "Step out" },
    { '<C-f>',      "<Cmd>lua require('dap').step_over() <CR>",         desc = "Step over" },
    { '<leader>dr', "<Cmd>lua require('dap').repl.toggle() <CR>",       desc = "Toggle repl" },
    { '<leader>dx', "<Cmd>lua require('dap').terminate() <CR>",         desc = "Close debugger" },
  },
  init = function()
    require 'which-key'.add {
      { '<leader>d', group = 'Debug' },
    }
  end,
  config = function()
    local dap = require 'dap'

    local dap_configs = require 'config.debug-adapters'
    local adapters = dap_configs.adapters
    local configs = dap_configs.configurations

    for k, v in pairs(adapters) do
      dap.adapters[k] = v
    end

    for k, v in pairs(configs) do
      dap.configurations[k] = v
    end

    vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint" })
    vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped", linehl = "", numhl = "" })
    vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "DapBreakpointCondition" })
    vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DapBreakpointRejected" })
  end
}
