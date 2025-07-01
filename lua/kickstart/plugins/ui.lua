return {
  -- your other plugins...

  {
    'NvChad/nvim-colorizer.lua',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      filetypes = { '*' },
      user_default_options = {
        names = true,
        RGB = true,
        RRGGBB = true,
        mode = 'background',
      },
    },
  },
}
