local M = {}

M.load = function (plugins)
  require "config.lazy.bootstrap".bootstrap()

  require "lazy".setup({
    spec = { import = plugins },
    install = { colorscheme = { "catppuccin" } },
    checker = { enabled = false }
  })
end

return M
