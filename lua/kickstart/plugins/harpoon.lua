return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local harpoon = require 'harpoon'
    harpoon.setup()

    local keymap = vim.keymap

    keymap.set('n', '<leader>a', function()
      harpoon:list():add()
    end, { desc = 'Add file to harpoon' })

    -- Telescope integration
    keymap.set('n', '<C-e>', function()
      local harpoon_list = harpoon:list()
      local file_paths = {}
      for _, item in ipairs(harpoon_list.items) do
        table.insert(file_paths, item.value)
      end

      local conf = require('telescope.config').values
      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon Files',
          finder = require('telescope.finders').new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
        })
        :find()
    end, { desc = 'Open Harpoon in Telescope' })

    -- Quick navigation
    keymap.set('n', '<C-h>', function()
      harpoon:list():select(1)
    end)
    keymap.set('n', '<C-t>', function()
      harpoon:list():select(2)
    end)
    keymap.set('n', '<C-n>', function()
      harpoon:list():select(3)
    end)
    keymap.set('n', '<C-s>', function()
      harpoon:list():select(4)
    end)

    keymap.set('n', '<C-S-P>', function()
      harpoon:list():prev()
    end)
    keymap.set('n', '<C-S-N>', function()
      harpoon:list():next()
    end)
  end,

  -- Ensure Telescope is loaded before this config runs
  after = 'telescope.nvim',
}
