return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  opts = {
    ensure_installed = {'c', 'lua', 'vimdoc', 'lua', 'vim', 'query', 'markdown', 'markdown_inline'},
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    }
  },
  config = function (_, opts)
    require 'nvim-treesitter.configs'.setup(opts)
  end,
}

