return {
  'kevinhwang91/nvim-ufo',
  dependencies = {'kevinhwang91/promise-async'},

  keys = {
    {'zR', "<Cmd>lua require('ufo').openAllFolds()<CR>", desc = "Open all folds"},
    {'zM', "<Cmd>lua require('ufo').closeAllFolds()<CR>", desc = "Close all folds"}
  },

  config = function ()
    local o = vim.o

    o.foldcolumn = '1'
    o.foldlevel = 99
    o.foldlevelstart = 99
    o.foldenable = true

    require 'ufo'.setup({
      provider_selector = function (_, _, _)
        return {'treesitter', 'indent'}
      end
    })
  end
}
