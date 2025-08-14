return {
  'tpope/vim-sleuth',
  lazy = false,
  init = function () -- set defaults
    local opt = vim.opt

    opt.tabstop = 4
    opt.shiftwidth = 4
    opt.expandtab = true
  end
}
