local M = {}
local config = require('config')
local hi = vim.highlight.create

local bg = '#181f21'

function M.disable_borders ()
  hi('VertSplit', { guifg = bg, guibg = bg }, false)
end

function M.enable ()
  require('everblush').setup({ nvim_tree = {
    contrast = config.plugins.specify.everblush.tree_contrast,
  }})

  if config.plugins.specify.everblush.borders == false then
    M.disable_borders()
  end
end

return M
