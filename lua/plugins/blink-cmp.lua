return {
  'saghen/blink.cmp',
  version = '1.*',
  build = 'cargo build --release',
  dependencies = {
    'Kaiser-Yang/blink-cmp-avante',
  },

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
      default = { 'lsp', 'path', 'buffer', 'snippets', 'avante'},
      providers = {
        avante = {
          module = 'blink-cmp-avante',
          name = "Avante",
          opts = {

          }
        }
      },
    },
    signature = { enabled = true },
    completion = { trigger = { prefetch_on_insert = false } },
    fuzzy = { implementation = "prefer_rust_with_warning" },
  }
}
