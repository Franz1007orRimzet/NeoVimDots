local function toggle_inlay_hint()
  local ih = vim.lsp.inlay_hint
  ih.enable(not ih.is_enabled())
end

return {
  'neovim/nvim-lspconfig',
  lazy = false,
  priority = 52,

  config = function()
    if not require('toggles').blink then
      local lspconfig = require 'lspconfig'
      local lspconfig_defaults = lspconfig.util.default_config
      lspconfig_defaults.capabilities = vim.tbl_deep_extend(
        'force',
        lspconfig_defaults.capabilities,
        require('cmp_nvim_lsp').default_capabilities()
      )
    end

    -- This is where you enable features that only work
    -- if there is a language server active in the file
    vim.api.nvim_create_autocmd('LspAttach', {
      desc = 'LSP actions',
      callback = function(_)
        local wk = require "which-key"
        local lsp = vim.lsp.buf

        wk.add(
          {
            { 'gd',         lsp.definition,              desc = "Go to definition" },
            { 'gD',         lsp.declaration,             desc = "Go to declaration" },
            { 'gi',         lsp.implementation,          desc = "Go to implementation" },
            { 'go',         lsp.type_definition,         desc = "Go to type definition" },
            { 'gr',         lsp.references,              desc = "Go to references" },
            { 'gs',         lsp.signature_help,          desc = "Signature help" },
            { '<leader>ci', toggle_inlay_hint,           desc = "Toggle inlay hint" },
            { '<F2>',       lsp.rename,                  desc = "Rename" },
            { '<F3>',       require('utils.lsp').format, desc = "Format" },
          },
          {
            mode = 'n',
            buffer = true
          }
        )
      end,
    })

    for server_name, config in pairs(require('config.lsp-servers').system) do
      require('utils.lsp').setup_server(server_name, config)
    end

    vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
    vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
    vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })
    vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })
  end
}
