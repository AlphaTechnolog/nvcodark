local M = {}
local config = require('config')
local present, decay = pcall(require, 'decay')

if not present then
  return {
    enable = function ()
      error('Cannot enable decay, cannot import decay module, make sure you have it installed')
    end
  }
end

function M.enable ()
  decay.setup(config.plugins.specify.decay)
end

return M
