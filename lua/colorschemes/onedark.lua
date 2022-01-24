local M = {}
local present, onedark = pcall(require, 'onedark')
local config = require('config')

if not present then
  return {
    enable = function ()
      error('[WARN/plugins/onedark] Cannot import onedark')
    end
  }
end

function M.get_options ()
  local onedark_config = config.plugins.specify.onedark or {}
  local onedark_style = onedark_config.style or 'dark'
  return { style = onedark_style }
end

function M.enable ()
  onedark.setup(M.get_options())
  onedark.load()
end

return M
