-- local function commands(commands)
--   return {
--     is_available = function()
--       for _, cmd in ipairs(commands) do
--         if cmd.optional ~= true and vim.fn.executable(cmd.cmd:match("^%S+")) ~= 1 then
--           return false
--         end
--       end
--       return true
--     end,
--     make_cmdline = function(changes)
--       local diff = table.concat(changes:diff(), "\n")
--       local cmdline = string.format("echo %s", vim.fn.shellescape(diff))
--       for _, cmd in ipairs(commands) do
--         if vim.fn.executable(cmd.cmd:match("^%S+")) == 1 then
--           cmdline = cmdline .. " | " .. cmd.cmd
--         end
--       end
--       return cmdline
--     end,
--   }
-- end

local function delta(cmd)
  cmd = cmd or "delta"
  return {
    is_available = function()
      return vim.fn.executable(cmd:match("^%S+")) == 1
    end,
    make_cmdline = function(changes)
      local diff = table.concat(changes:diff({ pseudo_args = "--git" }), "\n")
      return string.format("echo %s | %s", vim.fn.shellescape(diff), cmd)
    end,
  }
end

-- local function with_pager(cmd, pager)
--   pager = pager or "less -R"
--   return commands({ { cmd = cmd }, { cmd = pager, optional = true } })
-- end

-- local function diff_so_fancy(cmd, pager)
--   cmd = cmd or "diff-so-fancy"
--   return with_pager(cmd, pager)
-- end

local function code_actions()
  require('actions-preview').code_actions()
end

return {
  'aznhe21/actions-preview.nvim',
  keys = {
    {"<F4>", code_actions, desc = "Code action"},
    {"<leader>ca", code_actions, desc = "Code action"},
  },
  opts = {
    diff = {
      algorithm = "patience",
      ignore_whitespace = true
    },
    telescope = {
      sorting_strategy = "ascending",
      layout_strategy = "vertical",
      layout_config = {
        width = 0.8,
        height = 0.9,
        prompt_position = "top",
        preview_cutoff = 20,
        preview_height = function(_, _, max_lines)
          return max_lines - 15
        end,
      },
    },
    highlight_command = {
      -- require('actions-preview.highlight').delta(),
      delta(),
      -- diff_so_fancy()
    },
  },
}
