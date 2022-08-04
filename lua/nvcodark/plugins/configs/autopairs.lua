local M = {}
local present, autopairs = pcall(require, 'nvim-autopairs')

if not present then
   return { setup = function () end }
end

function M.setup ()
   autopairs.setup()
end

return M
