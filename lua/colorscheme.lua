local M = {}
local config = require('config')

function M.load ()
  local present, cs = pcall(require, 'colorschemes.' .. config.colorscheme)
  if not present then
    error('[WARN/colorscheme] Cannot load colorscheme: ' .. config.colorscheme .. ' -> ' .. cs)
  end
  cs.enable()
end

return M
