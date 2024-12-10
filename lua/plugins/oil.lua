return {
  'stevearc/oil.nvim',
  keys = { { '<C-e>', '<Cmd>Oil<CR>', desc = "Open file manager" } },
  dependencies = { "echasnovski/mini.icons" },
  config = true,
  lazy = false,
  opts = {
    delete_to_trash = true,
  }
}
