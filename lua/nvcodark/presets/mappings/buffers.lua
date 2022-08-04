local M = {}
local map = require "nvcodark.tools.map"

function M.run ()
   map.set('n', '<Tab>', map.cmd('bn!'))
   map.set('n', '<S-Tab>', map.cmd('bp!'))
   map.set('n', '<leader>x', map.cmd('Bdelete!'))
end

return M
