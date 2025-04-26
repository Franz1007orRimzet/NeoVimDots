return {
  name = 'sigil.nvim',
  dir = '~/Source/Repos/sigil.nvim',
  lazy = false,
  dev = true,
  config = function ()
    require('sigil').setup()
  end
}
