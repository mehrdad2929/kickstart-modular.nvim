-- Add this to your Lazy.nvim plugin configuration
-- Usually in ~/.config/nvim/lua/plugins/cmp.lua or in your main plugins file

return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    -- Snippet engine (required)
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',

    -- Completion sources
    'hrsh7th/cmp-nvim-lsp', -- LSP completions
    'hrsh7th/cmp-buffer', -- Buffer completions (for line suggestions from current buffer)
    'hrsh7th/cmp-path', -- Path completions
    'hrsh7th/cmp-cmdline', -- Command line completions

    -- Optional: Icons for completion menu
    'onsails/lspkind.nvim',
  },
  config = function()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    local lspkind = require 'lspkind'

    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      mapping = cmp.mapping.preset.insert {
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm { select = true },

        -- Tab and Shift-Tab for navigating completions
        --[[ ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),

        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }), ]]
      },

      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
      }, {
        { name = 'buffer', keyword_length = 3 }, -- Buffer completions for line suggestions
        { name = 'path' },
      }),

      formatting = {
        format = lspkind.cmp_format {
          mode = 'symbol_text',
          maxwidth = 50,
          ellipsis_char = '...',
        },
      },

      -- Completion window appearance
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },

      --[[ -- Enhanced completion behavior
      completion = {
        completeopt = 'menu,menuone,noinsert', -- Auto-select first item
      },

      -- Preselect first item
      preselect = cmp.PreselectMode.Item, ]]
    }

    -- Command line completion
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' },
      },
    })

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' },
      }, {
        { name = 'cmdline' },
      }),
    })
  end,
}
