return {
  'saghen/blink.cmp',
  version = '1.*',
  cond = require('toggles').blink,
  dependencies = {'milanglacier/minuet-ai.nvim'},
  build = 'cargo build --release',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = 'default',
      ['<A-y>'] = {function (cmp) cmp.show {providers = {'minuet'} } end}
    },
    appearance = {
      nerd_font_variant = 'mono'
    },
    sources = {
      default = { 'lsp', 'path', 'buffer', 'snippets'},
      providers = {
        minuet = {
          name = 'minuet',
          module = 'minuet.blink',
          async = true,
          -- Should match minuet.config.request_timeout * 1000,
          -- since minuet.config.request_timeout is in seconds
          timeout_ms = 3000,
          score_offset = 50, -- Gives minuet higher priority among suggestions
        },
      },
    },
    signature = { enabled = true },
    completion = { trigger = { prefetch_on_insert = false } },
  }
}
