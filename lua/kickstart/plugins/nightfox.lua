return {
  {
    'EdenEast/nightfox.nvim',
    lazy = false, -- Load immediately since it's a colorscheme
    priority = 1000, -- High priority to load before other plugins
    config = function()
      require('nightfox').setup {
        options = {
          -- Compiled file's destination location
          compile_path = vim.fn.stdpath 'cache' .. '/nightfox',
          compile_file_suffix = '_compiled', -- Compiled file suffix
          transparent = false, -- Disable setting background
          terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
          dim_inactive = false, -- Non focused panes set to alternative background
          module_default = true, -- Default enable value for modules
          colorblind = {
            enable = false, -- Enable colorblind support
            simulate_only = false, -- Only show simulated colorblind colors and not diff shifted
            severity = {
              protan = 0, -- Severity [0,1] for protan (red)
              deutan = 0, -- Severity [0,1] for deutan (green)
              tritan = 0, -- Severity [0,1] for tritan (blue)
            },
          },
          styles = { -- Style to be applied to different syntax groups
            comments = 'NONE', -- Value is any valid attr-list value `:help attr-list`
            conditionals = 'NONE',
            constants = 'NONE',
            functions = 'NONE',
            keywords = 'NONE',
            numbers = 'NONE',
            operators = 'NONE',
            strings = 'NONE',
            types = 'NONE',
            variables = 'NONE',
          },
          inverse = { -- Inverse highlight for different types
            match_paren = false,
            visual = false,
            search = false,
          },
          modules = { -- List of various plugins and additional options
            -- Add specific plugin integrations here if needed
          },
        },
        palettes = {
          -- Custom duskfox with black background
          duskfox = {
            bg1 = '#000000', -- Black background
            bg0 = '#1d1d2b', -- Alt backgrounds (floats, statusline, ...)
            bg3 = '#121820', -- 55% darkened from stock
            sel0 = '#131b24', -- 55% darkened from stock
          },
        },
        specs = {
          all = {
            inactive = 'bg0', -- Default value for other styles
          },
          duskfox = {
            inactive = '#090909', -- Slightly lighter then black background
          },
        },
        groups = {
          all = {
            NormalNC = { fg = 'fg1', bg = 'inactive' }, -- Non-current windows
          },
        },
      }

      -- Set the colorscheme after setup
      vim.cmd 'colorscheme nightfox'
    end,
  },
}
