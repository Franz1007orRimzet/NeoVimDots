local M = {}

M.init = function ()
  local o = vim.o
  local g = vim.g
  local opt = vim.opt

  o.autoread = true

  o.number = true
  o.relativenumber = true
  g.mapleader = " "
  -- g.maplocalleader = "\\"
  g.maplocalleader = " "

  o.signcolumn = 'yes'

  o.scrolloff = 5

  o.cursorline = true

  opt.tabstop = 4
  opt.shiftwidth = 4
  opt.expandtab = true

  vim.filetype.add{
    pattern = {
      ['${XDG_CONFIG_HOME}/hypr/.*%.conf'] = 'hyprlang'
    }
  }
end

return M
