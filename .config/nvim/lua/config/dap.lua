local dap = require('dap')
dap.adapters.python = {
  type = 'executable';
  command = '/home/oliver/panidigital/backend/sso/venv/bin/python';
  args = { '-m', 'debugpy.adapter' };
}

dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch';
    name = "Launch file";

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    program = "${file}"; -- This configuration will launch the current file if used.
    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python'
      elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
      else
        return '/usr/bin/python'
      end
    end;
  },
}

local M = {}
M.attach_python_debugger = function(args)
  local dap = require("dap")
  local host = "127.0.0.1" -- This should be configured for remote debugging if your SSH tunnel is setup.
  -- You can even make nvim responsible for starting the debugpy server/adapter:
  --  vim.fn.system({"${some_script_that_starts_debugpy_in_your_container}", ${script_args}})
  pythonAttachAdapter = {
    type = "server",
    host = host,
    port = tonumber(5678),
  }
  pythonAttachConfig = {
    type = "python",
    request = "attach",
    connect = {
      port = tonumber(5678),
      host = host,
    },
    mode = "remote",
    name = "Remote Attached Debugger",
    cwd = vim.fn.getcwd(),
    pathMappings = {
      {
        localRoot = vim.fn.getcwd(), -- Wherever your Python code lives locally.
        remoteRoot = "/server", -- Wherever your Python code lives in the container.
      },
    },
  }
  local session = dap.attach(host, tonumber(5678), pythonAttachConfig)
  if session == nil then
    io.write("Error launching adapter")
  end
  dap.repl.open()
end
