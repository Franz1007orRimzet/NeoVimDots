return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    -- 'saadparwaiz1/cmp_luasnip',
  },
  config = function ()
    local cmp = require 'cmp'

    cmp.setup({
      sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        {
          name = 'path',
          trailing_slash = true,
        },
      },
      snippet = {
        expand = function (args)
          vim.snippet.expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({select = false}),
      }),
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
    })
  end
}
