local M = {}

function M.setup ()
   require "nvcodark.core.packer".bootstrap()
   require "rc"
   require "nvcodark.plugins".setup()
end

return M
