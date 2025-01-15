return {
  'nvim-treesitter/nvim-treesitter',
  main = 'nvim-treesitter.configs',
  lazy = false,
  opts = {
    ensure_installed = {'c', 'lua', 'vimdoc', 'lua', 'vim', 'query', 'markdown', 'markdown_inline'},
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    }
  },
}

