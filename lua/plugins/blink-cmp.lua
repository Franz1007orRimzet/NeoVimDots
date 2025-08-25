return {
  'saghen/blink.cmp',
  version = '1.*',
  build = 'cargo build --release',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = 'default',
    },
    appearance = {
      nerd_font_variant = 'mono'
    },
    sources = {
      default = { 'lsp', 'path', 'buffer', 'snippets'},
      providers = {
      },
    },
    signature = { enabled = true },
    completion = { trigger = { prefetch_on_insert = false } },
    fuzzy = { implementation = "prefer_rust_with_warning" },
  }
}
