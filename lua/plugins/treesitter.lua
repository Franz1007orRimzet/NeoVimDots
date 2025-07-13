return {
  'nvim-treesitter/nvim-treesitter',
  main = 'nvim-treesitter.configs',
  -- branch = 'main',
  build = ":TSUpdate",
  lazy = false,
  opts = {
    ensure_installed = {'c', 'lua', 'vimdoc', 'lua', 'vim', 'query', 'markdown', 'markdown_inline'},
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true
    }
  },

  -- init = function ()
  --   vim.api.nvim_create_autocmd("FileType", {
  --     pattern = '*',
  --     callback = function ()
  --       vim.treesitter.start()
  --       vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
  --       vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  --     end
  --   })
  -- end
}

