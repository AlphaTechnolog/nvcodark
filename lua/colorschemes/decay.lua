local M = {}
local config = require('config')
local present, decay = pcall(require, 'decay')

if not present then
  return {
    enable = function ()
      print('[WARN/plugins/decay]: Cannot import decay')
    end
  }
end

function M.enable ()
  decay.setup(config.plugins.specify.decay)
end

return M
