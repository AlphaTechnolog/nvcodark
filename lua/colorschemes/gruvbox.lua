local M = {}
local hi = vim.highlight.create
local config = require('config')

function M.enable ()
  vim.g.gruvbox_contrast_dark = 'medium'
  vim.opt.background = 'dark'
  vim.cmd [[ colorscheme gruvbox ]]
  hi('EndOfBuffer', { guifg = '#282828' }, false)
  if config.plugins.specify.gruvbox.telescope_integration then
    hi('TelescopeSelection', { guibg = '#282828', guifg = '#b8bb26' }, false)
    hi('TelescopeBorder', { guifg = '#282828', guifg = '#a89984' }, false)
  end
  if config.plugins.specify.gruvbox.borders == false then
    hi('VertSplit', { guifg = '#282828' }, false)
  end
  if config.plugins.specify.gruvbox.tree_contrast then
    hi('NvimTreeNormal', { guibg = '#252525' }, false)
    hi('NvimTreeNormalNC', { guibg = '#252525' }, false)
    hi('NvimTreeStatusLine', { guibg = '#252525' }, false)
    hi('NvimTreeStatusLineNC', { guibg = '#252525' }, false)
    hi('NvimTreeVertSplit', { guifg = '#282828' }, false)
  elseif config.plugins.specify.gruvbox.borders == false then
    hi('NvimTreeVertSplit', { guifg = '#282828' }, false)
  end
end

return M
