-- Gruvbox Material, dark + soft contrast.
vim.g.gruvbox_material_background = 'soft'
vim.o.background = 'dark'
-- source the plugin's own colors file (a nested :colorscheme is ignored while one is loading)
local file = vim.api.nvim_get_runtime_file('colors/gruvbox-material.vim', false)[1]
vim.cmd('source ' .. vim.fn.fnameescape(file))
