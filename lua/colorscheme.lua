local M = {}
local config = require('config')

function M.load ()
  local present, config = pcall(require, 'colorschemes.' .. config.colorscheme)
  if not present then
    error('[WARN/colorscheme] Cannot load colorscheme: ' .. M.colorscheme)
  end
  config.enable()
end

return M
