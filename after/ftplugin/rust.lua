local wk = require('which-key')

wk.add(
{
  -- {'<leader>ca', vim.cmd.RustLsp('codeAction'), desc = "Code action"},
  -- {'<F4>', vim.cmd.RustLsp('codeAction'), desc = "Code action"},
  {'K', vim.cmd.RustLsp('hover', 'actrions')},
},
{
  mode = 'n',
  silent = true,
  buffer = true,
}
)
