local M = {}
local config = require('config')
local hi = vim.highlight.create

function M.get_palette ()
  return {
    bg = '#20202a',
    lighten = '#2c2e3e',
    darker_bg = '#1e1e27',
  }
end

function M.tree_contrast ()
  local palette = M.get_palette()
  local highlights = {
    'NvimTreeNormal', 'NvimTreeNormalNC',
  }
  for _, highlight in ipairs(highlights) do
    hi(highlight, { guibg = palette.darker_bg }, false)
  end
  local otherhis = {
    'NvimTreeEndOfBuffer',
    'NvimTreeStatusLine', 'NvimTreeStatusLineNC'
  }
  for _, highlight in ipairs(otherhis) do
    hi(highlight, { guibg = palette.darker_bg }, false)
  end
  hi('NvimTreeEndOfBuffer', { guibg = palette.darker_bg, guifg = palette.darker_bg }, false)
  hi('NvimTreeVertSplit', { guibg = palette.bg, guifg = palette.bg }, false)
end

function M.indents ()
  local palette = M.get_palette()
  hi('IndentBlanklineChar', { guifg = palette.lighten }, false)
  hi('NvimTreeIndentMarker', { guifg = palette.lighten }, false)
end

function M.enable ()
  vim.cmd [[ colorscheme aquarium ]]
  M.indents()
  if config.plugins.specify.aquarium.tree_contrast then
    M.tree_contrast()
  end
end

return M
