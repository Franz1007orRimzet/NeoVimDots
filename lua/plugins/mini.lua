return {
  'echasnovski/mini.nvim',
  version = false,
  lazy = false,
  opts = {
    splitjoin = {
      mappings = {
        toggle = 'gS',
      },
    },
  },
  config = function (_, opts)
    require('mini.splitjoin').setup(opts.splitjoin)
  end
}
