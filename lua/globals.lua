local M = {}

M.init = function ()
  local o = vim.o
  local g = vim.g

  o.number = true
  o.relativenumber = true
  g.mapleader = " "
  -- g.maplocalleader = "\\"
  g.maplocalleader = " "

  o.signcolumn = 'yes'

  o.scrolloff = 5


  -- o.tabstop = 4
  o.shiftwidth = 2
  o.expandtab = true
  -- o.autoindent = true
  -- o.smartindent = true
  o.cindent = true

  o.cursorline = true
end

return M
