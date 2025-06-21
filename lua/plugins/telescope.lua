return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      -- build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release',
      lazy = true,
    },
    'olimorris/persisted.nvim',
  },
  keys = {
    { '<leader>ff', "<Cmd>lua require('telescope.builtin').find_files()<CR>",                desc = "Find file" },
    { '<leader>fw', "<Cmd>lua require('telescope.builtin').live_grep()<CR>",                 desc = "Live grep" },
    { '<leader>fb', "<Cmd>lua require('telescope.builtin').buffers()<CR>",                   desc = "Find buffer" },
    { '<leader>fH', "<Cmd>lua require('telescope.builtin').help_tags()<CR>",                 desc = "Find help tags" },
    { '<leader>fh', "<Cmd>Telescope find_files hidden=true no_ignore=true<CR>",              desc = "Find hidden files"},
    { '<leader>fp', "<Cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>", desc = "Find in buffer" },
  },
  init = function()
    require('which-key').add({ { '<leader>f', group = "Find" } })
  end,
  config = function ()
    local telescope = require('telescope')

    telescope.load_extension('fzf')
    telescope.load_extension('persisted')
  end
}
