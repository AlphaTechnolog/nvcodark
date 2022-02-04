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

function M.enable ()
  vim.cmd [[ colorscheme catppuccin ]]
  if config.plugins.specify.catppuccin.tree_contrast == false then
    hi('NvimTreeNormal', { guibg = colors.black2 }, false)
  end
end

return M
