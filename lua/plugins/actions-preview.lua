local function code_actions()
  require('actions-preview').code_actions()
end

return {
  'aznhe21/actions-preview.nvim',
  keys = {
    {"<F4>", code_actions, desc = "Code action"},
    {"<leeader>ca", code_actions, desc = "Code action"},
  }
}
