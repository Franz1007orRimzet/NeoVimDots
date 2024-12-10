return {
  'williamboman/mason-lspconfig.nvim',
  dependencies = { 'williamboman/mason.nvim' },
  opts = {
    ensure_installed = { 'lua_ls', 'ts_ls', 'svelte' },
    handlers = {
      function(server_name)
        local servers = require 'config.lsp-servers'.mason
        require('lspconfig')[server_name].setup(servers[server_name] or {})
      end,
    },
  }
}
