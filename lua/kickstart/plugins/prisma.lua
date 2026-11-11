return {
  -- Syntax highlighting
  { 'prisma/vim-prisma' },

  -- Treesitter support

  -- LSP configuration
  {
    'neovim/nvim-lspconfig',
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      opts.servers.prismals = {}
      return opts
    end,
  },
}
