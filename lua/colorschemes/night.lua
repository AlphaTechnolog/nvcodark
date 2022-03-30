local M = {}
local present, night = pcall(require, 'night')
local config = require('config')

if not present then
  return {
    enable = function ()
      print('[WARN/night]: Cannot import night')
    end
  }
end

function M.enable ()
  night.setup(config.plugins.specify.night)
end

return M
