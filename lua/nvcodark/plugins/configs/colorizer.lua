local M = {}
local present, colorizer = pcall(require, 'colorizer')

if not present then
   return { setup = function () end }
end

function M.setup ()
   colorizer.setup()
end

return M
