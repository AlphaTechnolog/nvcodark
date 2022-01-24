local M = {}
local present, notify = pcall(require, 'notify')
local config = require('config')
local tables_utils = require('utils.tables')

if not present then
  return {
    setup = function ()
      error('[WARN/plugins/notify]: Cannot import nvim-notify')
    end
  }
end

function M.get_default_opts ()
  return {
    stages = 'slide',
    timeout = 2000,
    icons = {
      ERROR = "",
      WARN = "",
      INFO = "",
      DEBUG = "",
      TRACE = "✎",
    },
  }
end

function M.setup ()
  notify.setup(tables_utils.extend(
    M.get_default_opts(),
    config.plugins.specify.notify.options
  ))
end

return M
