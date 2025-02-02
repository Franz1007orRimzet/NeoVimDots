return {
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
      untracked = { text = "▎" },
    },
    signs_staged = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
    },
    on_attach = function ()
      local gs = require 'gitsigns'
      local wk = require 'which-key'

      wk.add {{'<leader>gh', group = "Hunk"}}

      local function next_hunk()
        if vim.wo.diff then
          vim.cmd.normal({"]c", bang = true})
        else
          gs.nav_hunk('next')
        end
      end

      local function prev_hunk()
        if vim.wo.diff then
          vim.cmd.normal({"[c", bang = true})
        else
          gs.nav_hunk('prev')
        end
      end

      wk.add({
        {']h', next_hunk, desc = "Go to next hunk"},
        {'[h', prev_hunk, desc = "Go to prev hunk"},
        {'[H', "<Cmd>Gitsigns nav_hunk first<CR>", desc = "Go to first hunk"},
        {']H', "<Cmd>Gitsigns nav_hunk last<CR>", desc = "Go to last hunk"},
        {'<leader>ghs', "<Cmd>Gitsigns stage_hunk<CR>", desc = "Stage hunk", mode = {'n', 'v'}},
        {'<leader>ghr', "<Cmd>Gitsigns reset_hunk<CR>", desc = "Reset hunk", mode = {'n', 'v'}},
        {'<leader>ghp', gs.preview_hunk_inline, desc = "Preview hunk inline"},
        {'<leader>gR', gs.reset_buffer, desc = "Reset buffer"},
        {'<leader>gb', function () gs.blame_line({full = true}) end, desc = "Blame line"},
        {'<leader>gs', gs.stage_buffer, desc = "Stage buffer"},
        {'<leader>gd', gs.diffthis, desc = "Diff this ~"},
        {'<leader>gD', function () gs.diffthis("~") end, desc = "Diff this ~"}
      }, { buffer = true, })
    end,
  }
}
