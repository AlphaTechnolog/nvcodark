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
  vim.cmd [[ colorscheme tokyonight ]]
end

return M
