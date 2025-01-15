local M = {}

local is_loaded = false

M.load = function(plugins)
  if not is_loaded then
    require "config.lazy.bootstrap".init()

    require "lazy".setup({
      spec = { import = plugins },
      install = { colorscheme = { "catppuccin" } },
      checker = { enabled = false }
    })
    is_loaded = true
  end
end

return M
