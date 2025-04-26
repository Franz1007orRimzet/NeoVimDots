local function get_lsps_formatted()
  local lsps = require('utils.lsp').get_local_lsps()

  if next(lsps) == nil then
    return ""
  end

  return "  LSP ~ " .. table.concat(lsps, " ")
end

local function session_active()
  local active = vim.g.persisting or false

  return active
end

local function session_icon()
  if session_active() then
    return '󰠘'
  else
    return '󱙄'
  end
end

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      icons_enabled = true,
      theme = 'catppuccin',
      component_separators = { left = '', right = '' }, -- opts /
      section_separators = { left = '', right = '' }, -- opts 
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      always_show_tabline = true,
      globalstatus = true,
      refresh = {
        statusline = 100,
        tabline = 100,
        winbar = 100,
      }
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch', 'diff' },
      lualine_c = { 'filename', 'diagnostics', session_icon },
      lualine_x = { get_lsps_formatted, 'filetype' },
      lualine_y = { {'searchcount',
        fmt =function (str)
          if str == "[0/0]" then
            return ""
          end
          return str
        end
      }, 'progress' },
      lualine_z = { 'selectioncount', 'location' }
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { 'filename' },
      lualine_x = { 'location' },
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
  }
}
