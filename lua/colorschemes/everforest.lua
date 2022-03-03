local M = {}
local config = require('config')
local hi = vim.highlight.create

function M.add_nvimtree_contrast ()
  local palette = {
    bg = '#20252a',
    softbg = '#2b3339'
  }
  local his = {'NvimTreeNormal', 'NvimTreeNormalNC', 'NvimTreeStatusLine', 'NvimTreeStatusLineNC'}
  for _, highlight in ipairs(his) do
    hi(highlight, { guibg = palette.bg }, false)
  end
  hi('NvimTreeVertSplit', { guibg = palette.softbg, guifg = palette.softbg }, false)
  hi('NvimTreeEndOfBuffer', { guibg = palette.bg, guifg = palette.bg }, false)
end

M.enable = function ()
  vim.g.everforest_background = 'hard'
  vim.g.everforest_enable_italic = config.plugins.specify.everforest.italic or false
  vim.g.everforest_disable_italic_comment = (not config.plugins.specify.everforest.italic_comment) or true
  vim.cmd [[ colorscheme everforest ]]
  hi('EndOfBuffer', { guifg = '#2b3339' }, false)
  if config.plugins.specify.everforest.tree_contrast then
    M.add_nvimtree_contrast()
  end
end

return M
