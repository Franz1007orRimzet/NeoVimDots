return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = require 'config.formatters'
  },
  keys = {
    { '<leader>cf', require('utils.lsp').format, mode = { 'n', 'v' }, desc = 'Format' }
  }
}
