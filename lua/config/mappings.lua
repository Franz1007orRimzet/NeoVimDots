return {
  {'<C-x>', '<C-\\><C-N>', noremap = true, mode = 't'},

  {'<C-y>', "<cmd> %y+ <CR>", desc = "Copy whole buffer", mode = 'n'},

  {'<leader>P', "\"_dP", desc = "Paste without copy", hidden = true, mode = 'v'},
  {'<leader>C', "\"_c", desc = "Replace without copy", hidden = true, mode = {'n', 'v'}},

  {';', ':', desc = "Enter command mode", mode = 'nv'},

  {'<M-j>', "<cmd>m .+1<CR>==", desc = "Move line down", mode = 'n' },
  {'<M-k>', "<cmd>m .-2<CR>==", desc = "Move line down", mode = 'n' },

  {'<M-j>', "<cmd>'<,'>m '>+1<cr>gv=gv", desc = "Move lines up", mode = 'v'},
  {'<M-k>', "<cmd>'<,'>m '<-2<cr>gv=gv", desc = "Move lines down", mode = 'v'},

  {"<C-b>", "<ESC>^i", desc = "Beginning of line", mode = 'i'},
  {"<C-e>", "<End>", desc = "End of line", mode = 'i'},

  {"<C-h>", "<Left>", desc = "Move left", mode = 'i'},
  {"<C-l>", "<Right>", desc = "Move right", mode = 'i' },
  {"<C-j>", "<Down>", desc = "Move down", mode = 'i' },
  {"<C-k>", "<Up>", desc = "Move up", mode = 'i' },
}
