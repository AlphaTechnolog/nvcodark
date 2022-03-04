local config = require('config')
local M = {}

function M.load_values (obj, conf)
  for name, value in pairs(conf) do
    obj[name] = value
  end
end

for optname, optconf in pairs(config.general) do
  M.load_values(vim[optname], optconf)
end

return M
