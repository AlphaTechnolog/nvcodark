local M = {}
local present, levuaska = pcall(require, 'levuaska')
local config = require('config')
local hi = vim.highlight.create

if not present then
  return {
    enable = function ()
      print('[WARN/levuaska]: Cannot import levuaska')
    end
  }
end

function M.apply_custom_contrast ()
  local bg = "#0d0d14"
  local originalbg = "#0f0f17"
  hi('NvimTreeNormal', { guibg = bg }, false)
  hi('NvimTreeNormalNC', { guibg = bg }, false)
  hi('NvimTreeStatusLine', { guibg = bg }, false)
  hi('NvimTreeStatusLineNC', { guibg = bg }, false)
  hi('NvimTreeVertSplit', { guibg = bg, guifg = originalbg }, false)
end

function M.enable ()
  levuaska.setup({ nvim_tree = { contrast = false } })
  if config.plugins.specify.levuaska.nvim_tree.contrast == true then
    M.apply_custom_contrast()
  end
end

return M
