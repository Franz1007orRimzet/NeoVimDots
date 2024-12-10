local M = {}

local function lsp_has_formatter()
  local bufnr = vim.api.nvim_get_current_buf() -- Get the current buffer number
  local clients = vim.lsp.get_clients({ bufnr = bufnr })

  for _, client in ipairs(clients) do
    if client.server_capabilities.documentFormattingProvider or client.server_capabilities.documentRangeFormattingProvider then
      return true -- Found an LSP client that supports formatting
    end
  end

  return false -- No LSP client supports formatting
end

local function format()
  local formatters = require 'config.formatters'
  local ft = vim.bo.filetype

  if formatters[ft] ~= nil then
    require 'conform'.format()
    return
  end

  if lsp_has_formatter() then
    vim.lsp.buf.format()
    return
  end

  vim.notify("There is no formatter available for " .. ft .. ".", vim.log.levels.WARN)
end

local function get_local_lsps()
  local bufnr = vim.api.nvim_get_current_buf()
  local clients = vim.lsp.get_clients({ bufnr = bufnr})
  local client_names = {}

  for _, client in pairs(clients) do
    table.insert(client_names, client.name)
  end

  return client_names
end

M.format = format
M.get_local_lsps = get_local_lsps
M.lsp_has_formatter = lsp_has_formatter

return M
