return {
  'yetone/avante.nvim',
  build = 'make',
  event = "VeryLazy",
  version = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope.nvim",
  },
  ---@module 'avante'
  ---@type avante.Config
  opts = {}
}
