return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  lazy = false,
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function ()
    require 'nvim-treesitter.configs'.setup {
      textobjects = {
        select = {
          enable = true,

          lookahead = true,

          keymaps = {
            ['af'] = { query = '@function.outer', desc = "Outer function" },
            ['if'] = { query = '@function.inner', desc = "Inner function" },
            ['al'] = { query = '@loop.outer', desc = "Outer loop" },
            ['il'] = { query = '@loop.inner', desc = "Inner loop" },
            ['ac'] = { query = '@class.outer', desc = "Outer class" },
            ['ic'] = { query = '@class.inner', desc = "Inner class" },
            ['aP'] = { query = '@parameter.outer', desc = "Outer parameter" },
            ['iP'] = { query = '@parameter.inner', desc = "Inner parameter" },
            ['ai'] = { query = '@conditional.outer', desc = "Outer conditional" },
            ['ii'] = { query = '@conditional.inner', desc = "Inner conditional" },
            ['aS'] = { query = '@block.outer', desc = "Outer block" },
            ['iS'] = { query = '@block.inner', desc = "Inner block" }
          }
        }
      }
    }
  end
}
