return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'folke/which-key.nvim',
  },
  config = function()
    local harpoon = require 'harpoon'

    -- REQUIRED
    harpoon:setup()
    -- REQUIRED

    -- Register which-key group
    require('which-key').add {
      { '<leader>p', group = '[P]rimeagen harpoon' },
    }

    -- Harpoon: Quick file navigation
    -- "Getting you where you want with the fewest keystrokes" - ThePrimeagen

    -- Add current file to harpoon list
    vim.keymap.set('n', '<leader>pa', function()
      harpoon:list():add()
    end, { desc = '[P]rimeagen: [A]dd file to harpoon' })

    -- Toggle harpoon quick menu
    vim.keymap.set('n', '<leader>pe', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = '[P]rimeagen: [E]dit harpoon list' })

    -- Quick file navigation (1-4)
    vim.keymap.set('n', '<leader>p1', function()
      harpoon:list():select(1)
    end, { desc = '[P]rimeagen: Go to file [1]' })

    vim.keymap.set('n', '<leader>p2', function()
      harpoon:list():select(2)
    end, { desc = '[P]rimeagen: Go to file [2]' })

    vim.keymap.set('n', '<leader>p3', function()
      harpoon:list():select(3)
    end, { desc = '[P]rimeagen: Go to file [3]' })

    vim.keymap.set('n', '<leader>p4', function()
      harpoon:list():select(4)
    end, { desc = '[P]rimeagen: Go to file [4]' })
  end,
}
