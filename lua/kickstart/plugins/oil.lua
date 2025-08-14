return {
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
    config = function()
      require('oil').setup {
        keymaps = {
          ['<C-h>'] = false, -- Remove default split mappings if they conflict
          ['<C-l>'] = false,
          ['<C-k>'] = false,
          ['<C-j>'] = false,
          ['<leader>e'] = 'actions.close', -- Close oil with leader+e (toggle behavior)
        },
      }
      vim.keymap.set('n', '<leader>e', '<cmd>Oil<CR>', { desc = 'Open parent directory' })
    end,
  },
}
