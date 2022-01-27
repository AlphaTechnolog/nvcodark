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

function M.get_tabline_config ()
  if config.tabbar.backend == 'lualine' then
    return tables.extend({
      lualine_a = {'buffers'},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {'branch'},
      lualine_z = {'tabs'}
    }, config.tabbar.options)
  else
    return {}
  end
end

M.setup = function ()
  lualine.setup {
    options = M.get_options(),
    tabline = M.get_tabline_config()
  }
end

return M
