local M = {}
local present, toggleterm = pcall(require, 'toggleterm')

if not present then
   return {
      setup = function () end
   }
end

function M.setup ()
   toggleterm.setup({
      size = 12,
      shade_terminals = false,
      persist_size = true,
      direction = 'horizontal',
      float_opts = {
         border = 'single',
         width = 2,
         height = 2,
         winblend = 3
      }
   })
end

return M
