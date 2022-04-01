local M = {}
local hi = vim.highlight.create
local config = require('config')

local palette = {
  contrast = '#171620',
  bg = '#191724',
  indent = '#26233a',
  green = '#9ccfd8'
}

function M.hide_eob ()
  hi('EndOfBuffer', { guibg = palette.bg, guifg = palette.bg }, false)
  hi('NvimTreeEndOfBuffer', { guibg = palette.bg, guifg = palette.bg }, false)
end

function M.indents ()
  hi('IndentBlanklineChar', { guifg = palette.indent }, false)
  hi('NvimTreeIndentMarker', { guifg = palette.indent }, false)
  hi('VertSplit', { guibg = palette.bg, guifg = palette.contrast }, false)
end

function M.tree ()
  hi('NvimTreeFolderIcon', { guifg = palette.green }, false)
  hi('NvimTreeFolderName', { guifg = palette.green }, false)
end

function M.tree_contrast ()
  hi('NvimTreeNormal', { guibg = palette.contrast }, false)
  hi('NvimTreeNormalNC', { guibg = palette.contrast }, false)
  hi('NvimTreeEndOfBuffer', { guibg = palette.contrast, guifg = palette.contrast }, false)
  hi('NvimTreeVertSplit', { guibg = palette.bg, guifg = palette.bg }, false)
end

function M.enable ()
  vim.cmd [[ colorscheme rose-pine ]]
  M.hide_eob()
  M.indents()
  M.tree()
  if config.plugins.specify.rosepine.tree_contrast == true then
    M.tree_contrast()
  end
end

return M
