return {
  {
    'sainnhe/gruvbox-material',
    lazy = false, -- Make sure it loads immediately
    config = function()
      vim.g.gruvbox_material_background = 'soft' -- 'hard' | 'medium' | 'soft'
      vim.g.gruvbox_material_enable_italic = true
      vim.g.gruvbox_material_enable_bold = true
    end,
  },
}
