local function code_action()
  vim.cmd.RustLsp 'codeAction'
end

local wk = require('which-key')

wk.add(
{
  {'K', function() vim.cmd.RustLsp {'hover', 'actions'} end},
  {'<F4>', code_action},
  {'<leader>ca', code_action},
},
{
  mode = 'n',
  silent = true,
  buffer = true,
}
)
