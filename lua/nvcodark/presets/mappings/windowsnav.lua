local M = {}
local map = require "nvcodark.tools.map"

function M.run ()
   local keys = { 'h', 'j', 'k', 'l' }

   for _, key in ipairs(keys) do
      map.set('n', '<C-' .. key .. '>', '<C-w>' .. key)
   end
end

return M
