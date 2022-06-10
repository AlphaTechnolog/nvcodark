local config = require('config')
local M = {}

for optname, optconf in pairs(config.general) do
  for name, value in pairs(optconf) do
    vim[optname][name] = value
  end
end

return M
