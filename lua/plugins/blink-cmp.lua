return {
  'saghen/blink.cmp',
  version = 'v0.*',
  cond = require('toggles').blink,

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = 'default' },
    appearance = {
      nerd_font_variant = 'mono'
    },
    sources = {
      default = { 'lsp', 'path', 'buffer', 'snippets' }
    },
    signature = { enabled = true },
  }
}
