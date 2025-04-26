local M = {
  formatters_by_ft = {
    c = { "clang_format" },
    cpp = { "clang_format" },
    cs = { "csharpier" },
    rust = { "rustfmt" },
    python = { "black", "isort" },
    -- lua = { "stylua" },
    typescript = { "prettier" },
    javascript = { "prettier" },
    svelte = { "prettier" },
    cmake = { "cmake_format" },
    sh = { "shfmt" },
  },
  formatters = {
    csharpier = {
      command = "dotnet-csharpier",
      args = { "--write-stdout" },
    },
  }
}

return M

