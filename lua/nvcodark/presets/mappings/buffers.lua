local M = {}
local map = require "nvcodark.tools.map"

function M.run ()
   map.set('n', '<Tab>', map.cmd('BufferNext'))
   map.set('n', '<S-Tab>', map.cmd('BufferPrevious'))
   map.set('n', '<leader>x', map.cmd('BufferClose!'))
   map.set('n', '<A-<>', map.cmd 'BufferMovePrevious')
   map.set('n', '<A->>', map.cmd 'BufferMoveNext')
end

return M
