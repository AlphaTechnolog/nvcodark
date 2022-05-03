local M = {}
local config = require('config')

function M.enable ()
  require('decay').setup(config.plugins.specify.decay)
end

return M
