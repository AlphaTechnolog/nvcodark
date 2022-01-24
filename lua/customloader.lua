local M = {}
local config = require('config')

function M.load ()
  for to_load, value in pairs(config.custom.load) do
    if value then
      local ok, modorerr = pcall(require, 'custom.' .. to_load)
      if not ok then
        error('[ERROR/customLoader]: Error at try to load ' .. to_load .. ': ' .. modorerr)
      end
      modorerr.init()
    end
  end
end

return M
