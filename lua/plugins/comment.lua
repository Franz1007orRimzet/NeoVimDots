return {
  'numToStr/Comment.nvim',
  config = true,
  keys = {
    {'<leader>/', "<cmd>lua require ('Comment.api').toggle.linewise.current()<CR>", desc = "Toggle Comment", mode = 'n'},
    {'<leader>/', "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", desc = "Toggle Comment", mode = 'v'}
  },
}
