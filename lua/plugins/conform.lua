return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = require 'config.formatters'.formatters_by_ft,
    formatters = require 'config.formatters'.formatters,
  },
  keys = {
    { '<leader>cf', require('utils.lsp').format, mode = { 'n', 'v' }, desc = 'Format' }
  }
}
