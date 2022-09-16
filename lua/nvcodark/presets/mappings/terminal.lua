local M = {}
local map = require "nvcodark.tools.map"
local hi = require "nvcodark.utils.hi"

function M.allow_exit ()
   vim.cmd [[
      autocmd TermEnter term://*toggleterm#*
            \ tnoremap <silent><C-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
   ]]
end

function M.run ()
   map.set('n', '<C-t>', map.cmd('ToggleTerm'))

   -- fix some highlights
   hi.override('StatusLineNC', { bg = hi.get_bg('StatusLine') })

   M.allow_exit()
end

return M
