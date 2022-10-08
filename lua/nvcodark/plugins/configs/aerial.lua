local M = {}
local map = require "nvcodark.tools.map"

function M.mappings()
   map.bulk {
      n = {
         {'<leader>fa', map.cmd 'AerialToggle'}
      }
   }
end

return M
