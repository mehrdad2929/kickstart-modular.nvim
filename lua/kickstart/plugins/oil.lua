-- Oil: edit your filesystem like a buffer

vim.pack.add {
  'https://github.com/echasnovski/mini.icons',
  'https://github.com/stevearc/oil.nvim',
}

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

-- vim: ts=2 sts=2 sw=2 et
