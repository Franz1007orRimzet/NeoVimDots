return {
  'catppuccin/nvim',
  name = 'catppuccin',
  lazy = false,
  priority = 1000,
  opts = {
    flavour = 'mocha',
    show_end_of_buffer = true,
    transparent_background = true,
    integrations = {
      cmp = true,
      harpoon = true,
      mason = true,
      treesitter = true,
      telescope = {
        enabled = true
      },
      which_key = true
    }
  },
  init = function ()
    vim.cmd.colorscheme 'catppuccin'
  end
}
