local M = {}
local map = require("nvcodark.tools.map")

function M.mappings ()
   map.bulk({
      n = {
         {'<C-p>', map.cmd "Telescope find_files"},
         {'<C-A-s>', map.cmd "Telescope live_grep"},
      },
   })
end

return M
