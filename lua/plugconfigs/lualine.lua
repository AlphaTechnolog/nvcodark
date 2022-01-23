local M = {}
local present, lualine = pcall(require, 'lualine')
local tables = require('utils.tables')
local config = require('config')

if not present then
  error('[WARN/plugins/lualine]: Disabling lualine because cannot import it')
end

function M.get_options()
  local default_config = {}
  return tables.extend(default_config, config.lualine)
end

M.setup = function ()
  lualine.setup {
    options = M.get_options()
  }
end

return M
