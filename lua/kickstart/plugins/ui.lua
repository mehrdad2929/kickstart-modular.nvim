vim.pack.add { 'https://github.com/NvChad/nvim-colorizer.lua' }

require('colorizer').setup {
  filetypes = { '*' },
  user_default_options = {
    names = true,
    RGB = true,
    RRGGBB = true,
    mode = 'background',
  },
}

-- vim: ts=2 sts=2 sw=2 et
