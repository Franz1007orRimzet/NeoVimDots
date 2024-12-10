local M = {
  c = { "clang_format" },
  cpp = { "clang_format" },
  rust = { "rustfmt" },
  python = { "black", "isort" },
  -- lua = { "stylua" },
  typescript = { "prettier" },
  javascript = { "prettier" },
  svelte = { "prettier" },
  cmake = { "cmake_format" },
  sh = { "shfmt" },
}

return M

