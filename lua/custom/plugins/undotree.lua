-- undotree.lua
--
-- Visualizes and navigates Vim's undo history as a tree
-- Allows you to see all changes and restore any previous state

return {
  'mbbill/undotree',
  config = function()
    -- Toggle undotree window
    vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = '[U]ndotree toggle' })
  end,
}
