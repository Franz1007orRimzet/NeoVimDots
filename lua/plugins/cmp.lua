return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'f3fora/cmp-spell',
    -- 'saadparwaiz1/cmp_luasnip',
  },
  cond = not require 'toggles'.blink,
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
        {
          name = 'spell',
        }
      },
      snippet = {
        expand = function (args)
          vim.snippet.expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({select = false}),
        ['<M-Down'] = cmp.mapping.scroll_docs(-4),
        ['<M-Up>'] = cmp.mapping.scroll_docs(4),
      }),
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      view = {
        entries = {name = 'custom', selection_order = 'near_cursor' }
      },
    })
  end
}
