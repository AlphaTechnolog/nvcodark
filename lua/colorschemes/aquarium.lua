local M = {}
local config = require('config')
local hi = vim.highlight.create

function M.get_palette ()
  local style = config.plugins.specify.aquarium.style or 'dark'
  local isdark = style == 'dark'
  return {
    bg = isdark and '#20202a' or '#E6E6F1',
    lighten = isdark and '#2c2e3e' or '#D5D4E0',
    darker_bg = isdark and '#1e1e27' or '#CCCBD9',
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
  -- using dark as default_style for aquarium
  vim.g.aquarium_style = config.plugins.specify.aquarium.style or 'dark'
  -- enabling theme
  vim.cmd [[ colorscheme aquarium ]]
  -- fixing indents
  M.indents()
  -- more highlights for tree
  if config.plugins.specify.aquarium.tree_contrast then
    M.tree_contrast()
  end
end

return M
