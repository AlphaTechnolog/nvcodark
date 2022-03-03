local M = {}
local present, error = pcall(require, 'catppuccin')
local config = require('config')
local hi = vim.highlight.create

if not present then
  return {
    enable = function ()
      print('[WARN/catppuccin]: Cannot import catppuccin: ' .. error)
    end
  }
end

local api = require('catppuccin.api.colors')
local colors = api.get_colors()

function M.custom_tree_contrast ()
  local contrastcolor = '#1c1c2c'
  local highlights = {'NvimTreeNormal', 'NvimTreeNormalNC', 'NvimTreeStatusLine', 'NvimTreeStatusLineNC'}
  for _, highlight in ipairs(highlights) do
    hi(highlight, { guibg = contrastcolor }, false)
  end
  hi('NvimTreeEndOfBuffer', { guibg = contrastcolor, guifg = contrastcolor }, false)
  hi('NvimTreeVertSplit', { guifg = colors.black2, guibg = colors.black2 }, false)
end

function M.enable ()
  vim.cmd [[ colorscheme catppuccin ]]
  if config.plugins.specify.catppuccin.tree_contrast == false then
    hi('NvimTreeNormal', { guibg = colors.black2 }, false)
    if config.plugins.specify.nvim_tree.hide_statusline == true then
      hi('NvimTreeStatusLineNC', { guibg = colors.black2 }, false)
    end
  else
    M.custom_tree_contrast()
  end
end

return M
