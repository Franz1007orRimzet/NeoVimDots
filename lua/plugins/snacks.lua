return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = {
      enabled = true,
    },
    bufdelete = {
      enabled = true,
    },
    git = {
      enabled = true,
    },
    lazygit = {
      enabled = true,
    },
    quickfile = {
      enabled = true
    },
    rename = {
      enabled = true
    },
    statuscolumn = {
      enabled = true
    },
    -- scratch = {
    --   enabled = true
    -- },
    dashboard = {
      enabled = true,
    }
  },
  init = function ()
    require ('which-key').add ({
      {'<leader>g', group = "Git"},
      {'<leader>b', group = "Buffer"},
    })
  end,
  keys = {
    {'<leader>gl', function () Snacks.lazygit() end, desc = "Lazygit"},
    {'<leader>gb', function () Snacks.git.blame_line() end, desc = "Blame Line"},
    {'<leader>gf', function () Snacks.lazygit.log_file() end, desc = "File History"},
    {'<leader>gL', function () Snacks.lazygit.log() end, desc = "Git log"},
    {'<leader>cR', function () Snacks.rename.rename_file() end, desc = "Rename File"},
    {'<leader>bd', function () Snacks.bufdelete() end, desc = "Delete Buffer"},
    -- {'<leader>bs', function () Snacks.scratch() end, desc = "Toggle scratch buffer"},
    -- {'<leader>bS', function () Snacks.scratch.select() end, desc = "Select scratch buffer"},
  }
}
