local M = {}

function M.run ()
   require "nvcodark.plugins.configs.ntree".mappings()
   require "nvcodark.plugins.configs.telescope".mappings()
end

return M
