local M = {}

M.start = function ()
  require('general')
  require('mappings')
  require('plugins')

  -- loading colorscheme
  local colors = require('colorscheme')
  colors.load()

  -- loading the plugins
  local plugloader = require('plugloader')
  plugloader.load_all()
end

return M
