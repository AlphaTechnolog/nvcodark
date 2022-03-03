local M = {}
local config = require('config')
local hi = vim.highlight.create

M.enable = function ()
  vim.g.everforest_background = 'hard'
  vim.g.everforest_enable_italic = config.plugins.specify.everforest.italic or false
  vim.g.everforest_disable_italic_comment = (not config.plugins.specify.everforest.italic_comment) or true
  vim.cmd [[ colorscheme everforest ]]
  hi('EndOfBuffer', { guifg = '#2b3339' }, false)
end

return M
