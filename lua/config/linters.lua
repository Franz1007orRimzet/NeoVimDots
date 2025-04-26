local M = {
  c = { "clangtidy", "cppcheck" },
  cs = {'csharpier'},
  cpp = { "clangtidy", "cppcheck" },
  rust = { "clippy" },
  python = { "flake8", "pylint" },
  lua = { "luacheck" },
  typescript = { "eslint" },
  javascript = { "eslint" },
  svelte = { "eslint" },
  cmake = { "cmakelint" },
  sh = { "shellcheck" },
  fish = { "fish" },
  make = { "checkmake" },
}

return M
