local map = require('utils.map')

local keys = { 'h', 'j', 'k', 'l' }
for _, key in ipairs(keys) do
  map.set('n', '<C-' .. key .. '>', '<C-w>' .. key)
end
