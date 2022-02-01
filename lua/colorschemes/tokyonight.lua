local M = {}
local present = pcall(require, 'tokyonight')
local config = require('config')

if not present then
  return {
    enable = function ()
      print('[WARN/tokyonight]: Cannot import tokyonight')
    end
  }
end

function M.enable ()
  local tokyonight_conf = config.plugins.specify.tokyonight or {}
  vim.g.tokyonight_style = tokyonight_conf.style or 'night'
  vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
  vim.g.tokyonight_italic_comments = tokyonight_conf.italics.comments
  vim.g.tokyonight_italic_keywords = tokyonight_conf.italics.keywords
  vim.g.tokyonight_italic_functions = tokyonight_conf.italics.functions
  vim.g.tokyonight_italic_variables = tokyonight_conf.italics.variables
  vim.g.tokyonight_hide_inactive_statusline = true
  vim.cmd [[ colorscheme tokyonight ]]
end

return M
