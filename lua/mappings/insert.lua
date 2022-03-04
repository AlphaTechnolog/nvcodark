local map = require('utils.map')

local keys = { 'jk', 'kj', 'jj', 'kk' }
for _, key in ipairs(keys) do
  map.set('i', key, '<esc>')
end
