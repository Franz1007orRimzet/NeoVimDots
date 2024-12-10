return {
  'akinsho/toggleterm.nvim',
  keys = {
    {'<A-i>', '<Cmd>ToggleTerm direction=float<CR>', mode = {'n', 't'}},
    {'<A-h>', '<Cmd>ToggleTerm direction=horizontal<CR>', mode = {'n', 't'}},
    {'<A-v>', '<Cmd>ToggleTerm direction=vertical size=70<CR>', mode = {'n', 't'}},
  },
  config = true,
}
