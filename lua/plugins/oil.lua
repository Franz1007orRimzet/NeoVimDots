return {
  'stevearc/oil.nvim',
  keys = { { '<C-e>', '<Cmd>Oil<CR>', desc = "Open file manager" } },
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  lazy = false,
  opts = {
    delete_to_trash = true,
  }
}
