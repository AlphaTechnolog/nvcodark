local ok, nvcodark = pcall(require, 'nvcodark.core')

if not ok then
   error('Cannot import nvcodark core: ' .. nvcodark)
end

local M = {}

function M.run ()
   local finished, err = pcall(nvcodark.setup)

   if not finished then
      error('Cannot setup nvcodark: ' .. err)
   end
end

return M
