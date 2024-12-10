-- local formatter_blacklist = {
--   'pyright',
-- }
--
-- local function is_on_blacklist(item)
--   for _, v in pairs(formatter_blacklist) do
--     if v == item then
--       return true
--     end
--   end
--   return false
-- end

return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v4.x',
  -- config = function()
  --   vim.api.nvim_create_autocmd('LspAttach', {
  --     callback = function(event)
  --       local id = vim.tbl_get(event, 'data', 'client_id')
  --       local client = id and vim.lsp.get_client_by_id(id)
  --       if client == nil then
  --         return
  --       end
  --
  --       if is_on_blacklist(client.name) then
  --         return
  --       end
  --
  --       -- if client.supports_method('textDocument/formatting') then
  --       --   require('lsp-zero').buffer_autoformat()
  --       -- end
  --
  --       -- local wk = require 'which-key'
  --       --
  --       -- wk.add({
  --       --   {'<leader>cf', function ()
  --       --     vim.lsp.buf.format({async = false, timeout_ms = 10000})
  --       --   end}
  --       -- }, {
  --       --   mode = {'n', 'x'},
  --       --   buffer = true
  --       -- })
  --     end
  --   })
  -- end
}
