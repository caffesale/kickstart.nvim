return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'

    harpoon:setup {
      settings = {
        save_on_toggle = true,
        save_on_change = true,
        save_on_ui_close = true,
      },
    }

    local map = vim.keymap
    map.set('n', '<leader>a', function()
      harpoon:list():add()
    end, { desc = 'Harpoon add file' })

    map.set('n', '<leader>h', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Harpoon quick menu ' })

    map.set('n', '<C-n>', function()
      harpoon:list():next()
    end, {
      desc = 'Next Harpoon file',
    })

    map.set('n', '<C-p>', function()
      harpoon:list():prev()
    end, {
      desc = 'Prev Harpoon file',
    })
  end,
}
