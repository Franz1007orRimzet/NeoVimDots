local M = {
  system = {},
  mason = {},
}

M.system.clangd = {
  cmd = {'clangd', '--experimental-modules-support', '--background-index', '--clang-tidy'},
}
-- M.mason.csharp_ls = {
--   handlers = {
--     ["textDocument/definition"] = require('csharpls_extended').handler,
--     ["textDocument/typeDefinition"] = require('csharpls_extended').handler,
--   },
--   keys = {
--     {
--       "gd",
--       function()
--         require("csharpls_extended").telescope_lsp_definitions()
--       end,
--       desc = "Goto Definition",
--     },
--   },
--   enable_roslyn_analyzers = true,
--   organize_imports_on_format = true,
--   enable_import_completion = true,
-- }

-- M.system.zls = {}

return M
