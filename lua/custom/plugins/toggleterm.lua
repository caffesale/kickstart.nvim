return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {
    size = function(term)
      if term.direction == 'horizontal' then
        return 15
      elseif term.direction == 'vertical' then
        return vim.o.columns * 0.4
      end
    end,
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    shade_terminals = true,
    start_in_insert = true,
    insert_mappings = true,
    terminal_mappings = true,
    persist_size = true,
    persist_mode = true,
    direction = 'horizontal',
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
      border = 'curved',
      winblend = 0,
    },
  },
  config = function(_, opts)
    require('toggleterm').setup(opts)

    -- Terminal mode mappings
    vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { desc = 'Exit terminal mode' })
    vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], { desc = 'Move to left window' })
    vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], { desc = 'Move to lower window' })
    vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], { desc = 'Move to upper window' })
    vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], { desc = 'Move to right window' })
  end,
}
