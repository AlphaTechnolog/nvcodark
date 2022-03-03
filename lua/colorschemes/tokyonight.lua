local M = {}
local present = pcall(require, 'tokyonight')
local config = require('config')
local hi = vim.highlight.create

if not present then
  return {
    enable = function ()
      print('[WARN/tokyonight]: Cannot import tokyonight')
    end
  }
end

function M.disable_tree_contrast ()
  local colors = require('tokyonight.colors').setup()
  local keys = {
    'NvimTreeNormal', 'NvimTreeNormalNC',
    'NvimTreeStatusLine', 'NvimTreeStatusLineNC',
  }
  for _, key in ipairs(keys) do
    hi(key, { guibg = colors.bg }, false)
  end
  hi('NvimTreeVertSplit', { guibg = colors.bg, guifg = colors.bg }, false)
end

function M.custom_nvimtree_folder_icons ()
  local colors = require('tokyonight.colors').setup()
  hi('NvimTreeFolderIcon', { guifg = colors.blue }, false)
end

function M.enable ()
  local tokyonight_conf = config.plugins.specify.tokyonight or {}
  vim.g.tokyonight_style = tokyonight_conf.style or 'night'
  vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
  vim.g.tokyonight_italic_comments = tokyonight_conf.italics.comments
  vim.g.tokyonight_italic_keywords = tokyonight_conf.italics.keywords
  vim.g.tokyonight_italic_functions = tokyonight_conf.italics.functions
  vim.g.tokyonight_italic_variables = tokyonight_conf.italics.variables
  vim.cmd [[ colorscheme tokyonight ]]
  if config.plugins.specify.tokyonight.tree_contrast == false then
    M.disable_tree_contrast()
  end
  if config.plugins.specify.tokyonight.custom_folder_icons == true then
    M.custom_nvimtree_folder_icons()
  end
end

return M
