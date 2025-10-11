-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

return {
  -- NOTE: Yes, you can install new plugins here!
  'mfussenegger/nvim-dap',
  -- NOTE: And you can specify dependencies as well
  dependencies = {
    -- Creates a beautiful debugger UI
    'rcarriga/nvim-dap-ui',

    -- Required dependency for nvim-dap-ui
    'nvim-neotest/nvim-nio',

    -- Installs the debug adapters for you
    'mason-org/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',
    --
    --virtual text
    'theHamsta/nvim-dap-virtual-text',

    -- Add your own debuggers here
    'leoluz/nvim-dap-go',
  },
  keys = {
    -- Basic debugging keymaps, feel free to change to your liking!
    {
      '<leader>d',
      group = 'Debugger',
      nowait = true,
      remap = false,
      desc = 'debugger',
    },
    {
      '<leader>dt',
      function()
        require('dap').toggle_breakpoint()
      end,
      desc = 'Toggle Breakpoint',
      nowait = true,
      remap = false,
    },

    {
      '<leader>dT',
      function()
        require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
      end,
      desc = 'Set Breakpoint',
      nowait = true,
      remap = false,
    },
    {
      '<leader>dc',
      function()
        require('dap').continue()
      end,
      desc = 'Continue',
      nowait = true,
      remap = false,
    },
    {
      '<leader>di',
      function()
        require('dap').step_into()
      end,
      desc = 'Step Into',
      nowait = true,
      remap = false,
    },
    {
      '<leader>do',
      function()
        require('dap').step_over()
      end,
      desc = 'Step Over',
      nowait = true,
      remap = false,
    },
    {
      '<leader>du',
      function()
        require('dap').step_out()
      end,
      desc = 'Step Out',
      nowait = true,
      remap = false,
    },
    {
      '<leader>dr',
      function()
        require('dap').repl.open()
      end,
      desc = 'Open REPL',
      nowait = true,
      remap = false,
    },

    {
      '<leader>dR',
      function()
        require('dap').repl.close()
      end,
      desc = 'Close REPL',
      nowait = true,
      remap = false,
    },
    {
      '<leader>dl',
      function()
        require('dap').run_last()
      end,
      desc = 'Run Last',
      nowait = true,
      remap = false,
    },
    {
      '<leader>dq',
      function()
        require('dap').terminate()
        require('dapui').close()
        require('nvim-dap-virtual-text').toggle()
      end,
      desc = 'Terminate',
      nowait = true,
      remap = false,
    },
    {
      '<leader>db',
      function()
        require('dap').list_breakpoints()
      end,
      desc = 'List Breakpoints',
      nowait = true,
      remap = false,
    },
    {
      '<leader>de',
      function()
        require('dap').set_exception_breakpoints { 'all' }
      end,
      desc = 'Set Exception Breakpoints',
      nowait = true,
      remap = false,
    },
    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    {
      '<leader>ds',
      function()
        require('dapui').toggle()
      end,
      desc = 'See last session result.',
    },
  },
  config = function()
    local mason_dap = require 'mason-nvim-dap'
    local dap = require 'dap'
    local dapui = require 'dapui'
    local dap_virtual_text = require 'nvim-dap-virtual-text'

    mason_dap.setup {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_installation = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},

      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
        'delve',
        'js-debug-adapter',
        'node-debug2-adapter', -- Add Node.js debug adapter
      },
    }

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    dapui.setup {
      -- Set icons to characters that are more likely to work in every terminal.
      --    Feel free to remove or use ones that you like more! :)
      --    Don't feel like these are good choices.
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
        icons = {
          pause = '⏸',
          play = '▶',
          step_into = '⏎',
          step_over = '⏭',
          step_out = '⏮',
          step_back = 'b',
          run_last = '▶▶',
          terminate = '⏹',
          disconnect = '⏏',
        },
      },
    }

    -- Change breakpoint icons
    -- vim.api.nvim_set_hl(0, 'DapBreak', { fg = '#e51400' })
    -- vim.api.nvim_set_hl(0, 'DapStop', { fg = '#ffcc00' })
    -- local breakpoint_icons = vim.g.have_nerd_font
    --     and { Breakpoint = '', BreakpointCondition = '', BreakpointRejected = '', LogPoint = '', Stopped = '' }
    --   or { Breakpoint = '●', BreakpointCondition = '⊜', BreakpointRejected = '⊘', LogPoint = '◆', Stopped = '⭔' }
    -- for type, icon in pairs(breakpoint_icons) do
    --   local tp = 'Dap' .. type
    --   local hl = (type == 'Stopped') and 'DapStop' or 'DapBreak'
    --   vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
    -- end

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    -- Install golang specific config
    require('dap-go').setup {
      delve = {
        -- On Windows delve must be run attached or it crashes.
        -- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
        detached = vim.fn.has 'win32' == 0,
      },
    }

    -- Modern Node.js debugging configuration using js-debug-adapter
    dap.adapters['pwa-node'] = {
      type = 'server',
      host = 'localhost',
      port = '${port}',
      executable = {
        command = 'node',
        args = {
          vim.fn.stdpath 'data' .. '/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js',
          '${port}',
        },
      },
    }

    -- JavaScript configurations
    dap.configurations.javascript = {
      {
        type = 'pwa-node',
        request = 'launch',
        name = 'Launch Current File',
        program = '${file}',
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
      },
      {
        type = 'pwa-node',
        request = 'launch',
        name = 'Launch with Arguments',
        program = '${file}',
        cwd = vim.fn.getcwd(),
        args = function()
          local args_string = vim.fn.input 'Arguments: '
          return vim.split(args_string, ' ')
        end,
        sourceMaps = true,
      },
      {
        type = 'pwa-node',
        request = 'attach',
        name = 'Attach to Process',
        processId = require('dap.utils').pick_process,
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
      },
      {
        type = 'pwa-node',
        request = 'launch',
        name = 'Debug npm script',
        runtimeExecutable = 'npm',
        runtimeArgs = function()
          local script = vim.fn.input 'npm script: '
          return { 'run', script }
        end,
        rootPath = vim.fn.getcwd(),
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
      },
    }

    -- TypeScript configurations
    dap.configurations.typescript = {
      {
        type = 'pwa-node',
        request = 'launch',
        name = 'Launch TypeScript File',
        program = '${file}',
        cwd = vim.fn.getcwd(),
        runtimeArgs = { '--loader', 'ts-node/esm' },
        sourceMaps = true,
      },
      {
        type = 'pwa-node',
        request = 'launch',
        name = 'Launch TypeScript with ts-node',
        runtimeExecutable = 'ts-node',
        program = '${file}',
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
      },
    }
  end,
}
