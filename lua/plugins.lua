-- Load plugin modules in order.

require 'kickstart.plugins.guess-indent'
require 'kickstart.plugins.gitsigns'
require 'kickstart.plugins.which-key'
require 'kickstart.plugins.todo-comments'
require 'kickstart.plugins.mini'
require 'kickstart.plugins.telescope'
require 'kickstart.plugins.lspconfig'
require 'kickstart.plugins.conform'
require 'kickstart.plugins.blink-cmp'
require 'kickstart.plugins.treesitter'

-- Extra plugins
require 'kickstart.plugins.startify'
require 'kickstart.plugins.harpoon'
require 'kickstart.plugins.oil'
require 'kickstart.plugins.fugitive'
require 'kickstart.plugins.markdown-preview'
require 'kickstart.plugins.ui'
require 'kickstart.plugins.prisma'
require 'kickstart.plugins.typescript-tools'
require 'kickstart.plugins.debug'
require 'kickstart.plugins.indent_line'
require 'kickstart.plugins.lint'

-- Colorschemes. Only the one applied below is used, comment out the rest to skip installing them.
require 'kickstart.plugins.rosepine'
require 'kickstart.plugins.ayu'
require 'kickstart.plugins.darkness'
require 'kickstart.plugins.komau-vim'
require 'kickstart.plugins.vim-256noir'
require 'kickstart.plugins.kanagawa'
require 'kickstart.plugins.no-clown-fiesta'
require 'kickstart.plugins.vim-phoenox'
require 'kickstart.plugins.nightfox'
require 'kickstart.plugins.gruvbox'
require 'kickstart.plugins.iceberg'
require 'kickstart.plugins.ice-cave'
require 'kickstart.plugins.outilnedark'

-- Startup colorscheme: this is the only place to change it.
vim.cmd.colorscheme 'rose-pine'

-- NOTE: You can add your own plugins, configuration, etc. in `lua/custom/plugins/*.lua`.
--
-- For independent modules, uncomment the convenience loader:
-- require 'custom.plugins'

-- vim: ts=2 sts=2 sw=2 et
