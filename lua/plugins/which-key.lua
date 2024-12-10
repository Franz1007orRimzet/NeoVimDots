return {
  'folke/which-key.nvim',
  event = "VeryLazy",
  init = function()
    require('which-key').add(require 'config.mappings')
  end
  -- keys = {
  --   {
  --     "<leader>?",
  --     function()
  --       require("which-key").show({ global = false })
  --     end,
  --     desc = "Buffer Local Keymaps (which-key)",
  --   },
  -- },
}
