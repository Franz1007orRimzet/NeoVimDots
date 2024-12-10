local function split_args(str)
  local tokens = {}
  local token = ""
  local in_quote = false
  local quote_char = nil

  for i = 1, #str do
    local c = str:sub(i, i)

    if in_quote then
      if c == quote_char then
        in_quote = false
        table.insert(tokens, token)
        token = ""
      else
        token = token .. c
      end
    elseif c == '"' or c == "'" then
      in_quote = true
      quote_char = c
    elseif c == " " then
      if token ~= "" then
        table.insert(tokens, token)
        token = ""
      end
    elseif c == "\\" then
      -- Handle escaped characters (assuming only quotes and backslashes are escaped)
      local next_char = str:sub(i + 1, i + 1)
      if next_char == quote_char or next_char == "\\" then
        token = token .. next_char
        i = i + 1
      else
        token = token .. c
      end
    else
      token = token .. c
    end
  end

  if token ~= "" then
    table.insert(tokens, token)
  end

  return tokens
end

local function take_args()
  local input = vim.fn.input('Program arguments (space-separated): ')
  return split_args(input)
end

local config = {
  adapters = {
    codelldb = {
      type = 'server',
      port = '${port}',
      executable = {
        command = 'codelldb',
        args = { '--port' , '${port}'}
      }
    },
    python = {
      type = 'executable',
      command = 'python',
      args = { '-m', 'debugpy.adapter' }
    }
  },
  configurations = {
    cpp = {
      {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function ()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = take_args,
      }
    },
    python = {
      {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        pythonPath = function ()
          local python_path = vim.fn.exepath('python') or 'python3'
          return python_path
        end,
        args = take_args,
      }
    }
  }
}

config.configurations.c = config.configurations.cpp
config.configurations.rust = config.configurations.cpp

return config
