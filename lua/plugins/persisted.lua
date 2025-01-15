return {
  'olimorris/persisted.nvim',
  lazy = false,
  config = true,
  keys = {
    {'<leader>sf', function () require('telescope').extensions.persisted.persisted() end, desc = "Find sessions"},
    {'<leader>st', '<Cmd>SessionToggle<CR>', desc = "Toggle session recording"},
    {'<leader>sd', '<Cmd>SessionDelete<CR>', desc = "Delete current session"},
    {'<leader>ss', '<Cmd>SessionSave<CR>', desc = "Save current session"},
    {'<leader>sS', '<Cmd>SessionStart<CR>', desc = "Start recording session"},
    {'<leader>se', '<Cmd>SessionStop<CR>', desc = "Stop recording session"},
    {'<leader>sl', '<Cmd>SessionLoadLast<CR>', desc = "Load last session"}
  },
  init = function ()
    require('which-key').add({
      {'<leader>s', group = "Session"}
    })
  end,
}
