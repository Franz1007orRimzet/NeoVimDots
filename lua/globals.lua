local M = {}

M.init = function ()
  local o = vim.o
  local g = vim.g

  o.autoread = true

  o.number = true
  o.relativenumber = true
  g.mapleader = " "
  -- g.maplocalleader = "\\"
  g.maplocalleader = " "

  o.signcolumn = 'yes'

  o.scrolloff = 5

  o.cursorline = true

  vim.filetype.add{
    pattern = {
      ['${XDG_CONFIG_HOME}/hypr/.*%.conf'] = 'hyprlang'
    }
  }
end

return M
