local M = {}
local map = require('utils.map')

function M.mappings ()
  for i = 1, 9 do
    map.set('n', '<A-' .. i .. '>', map.cmd('BufferGoto ' .. i))
  end
  map.set('n', '<C-A-p>', map.cmd('BufferPick'))
  map.set('n', '<A-<>', map.cmd('BufferMovePrevious'))
  map.set('n', '<A->>', map.cmd('BufferMoveNext'))
end

return M
