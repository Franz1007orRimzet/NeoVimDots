return {
  'olimorris/persisted.nvim',
  lazy = false,
  keys = {
    {'<leader>sf', function () require('telescope').extensions.persisted.persisted() end, desc = "Find sessions"},
    {'<leader>st', '<Cmd>SessionToggle<CR>', desc = "Toggle session recording"},
    {'<leader>sd', '<Cmd>SessionToggle<CR>', desc = "Delete current session"},
    {'<leader>ss', '<Cmd>SessionSave<CR>', desc = "Save current session"},
    {'<leader>sl', '<Cmd>SessionLoadLast<CR>', desc = "Load last session"}
  },
  init = function ()
    require('which-key').add({
      {'<leader>s', group = "Session"}
    })
  end,
  config = function (_, opts)
    require('persisted').setup(opts)
    require('telescope').load_extension('persisted')
  end
}
