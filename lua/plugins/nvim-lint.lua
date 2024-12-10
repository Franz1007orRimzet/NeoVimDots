return {
  'mfussenegger/nvim-lint',
  keys = {
    { '<leader>xt', '<Cmd>Lint<CR>', desc = "Lint"},
    { '<leader>xT', '<Cmd>ToggleAutoLint<CR>', desc = "Toggle AutoLinter" },
    { '<leader>xc', '<Cmd>NoLint<CR>', desc = "Hide linter diags" },
  },
  config = function()
    local lint = require 'lint'
    local linters_by_ft = require 'config.linters'
    lint.linters_by_ft = linters_by_ft


    local enable_by_ft = {}


    local function lint_file()
      lint.try_lint()
    end

    local function autolint()
      local ft = vim.bo.filetype
      if enable_by_ft[ft] then
        lint_file()
      end
    end

    local function nolint()
      local linters = linters_by_ft[vim.bo.filetype] or {}

      for _, linter in ipairs(linters) do
        local ns = lint.get_namespace(linter)
        vim.diagnostic.reset(ns, 0)
      end
    end

    local function toggle_autolinter()
      local ft = vim.bo.filetype
      local enable = not enable_by_ft[ft]

      enable_by_ft[ft] = enable

      if enable then
        lint_file()
      else
        nolint()
      end
    end

    vim.api.nvim_create_user_command(
      'Lint',
      lint_file,
      {
        nargs = 0,
        bang = false,
      }
    )

    vim.api.nvim_create_user_command(
      'NoLint',
      nolint,
      {
        nargs = 0,
        bang = false,
      }
    )

    vim.api.nvim_create_user_command(
      'ToggleAutoLint',
      toggle_autolinter,
      {
        nargs = 0,
        bang = false
      }
    )

    vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
      callback = autolint
    })
  end,
}
