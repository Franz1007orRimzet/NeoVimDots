local function toggle_telescope()
  local conf = require 'telescope.config'.values
  local list = require('harpoon'):list()

  local file_paths = {}
  for _, item in ipairs(list.items) do
    table.insert(file_paths, item.value)
  end

  require("telescope.pickers").new({}, {
    prompt_title = "Harpoon",
    finder = require("telescope.finders").new_table({
      results = file_paths,
    }),
    previewer = conf.file_previewer({}),
    sorter = conf.generic_sorter({}),
  }):find()
end

local function add()
  require('harpoon'):list():add()
end

local function next()
  require('harpoon'):list():next()
end

local function prev()
  require('harpoon'):list():prev()
end

local function menu()
  local harpoon = require('harpoon')
  harpoon.ui:toggle_quick_menu(harpoon:list())
end

return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { '<leader>fm', toggle_telescope,   desc = "Find marked" },
    { '\\',         add,                desc = "Mark buffer" },
    { '<A-\\>',     menu,               desc = "Open mark menu" },
    { '<A-]>',      next,               desc = "Next marked buffer" },
    { '<A-[>',      prev,               desc = "Previous marked buffer" }
  },
  config = function()
    require('harpoon'):setup({})
  end
}
