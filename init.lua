-- TODO: Need to remake the README.md

local core = require('core')
local ok, err = pcall(core.start)

if not ok then
  error('Cannot start nvcodark (some issues detected): ' .. err)
end
