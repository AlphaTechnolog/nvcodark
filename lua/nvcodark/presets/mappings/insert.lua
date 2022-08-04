local map = require "nvcodark.tools.map"
local M = {}

function M.run ()
   local keys = { 'jk', 'kj', 'jj', 'kk' }

   for _, key in ipairs(keys) do
      map.set('i', key, '<esc>')
   end
end

return M
