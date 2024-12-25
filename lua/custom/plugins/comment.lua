return {
  'numToStr/Comment.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'JoosepAlviste/nvim-ts-context-commentstring',
  },
  config = function()
    local comment = require 'Comment'
    local prehook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()

    comment.setup {
      padding = true,
      sticky = true,
      ignore = '^$',
      toggler = {
        line = 'gcc',
        block = 'gbc',
      },
      opleader = {
        line = 'gc',
        block = 'gb',
      },
      extra = {
        above = 'gcO',
        below = 'gco',
        eol = 'gcA',
      },
      mappings = {
        basic = true,
        extra = true,
        extended = false,
      },
      pre_hook = prehook,
      post_hook = function() end,
    }
  end,
}
