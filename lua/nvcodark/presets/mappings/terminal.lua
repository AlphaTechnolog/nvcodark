local M = {}
local map = require "nvcodark.tools.map"
local hi = require "nvcodark.utils.hi"
local highlight = vim.highlight.create

function M.allow_exit ()
   vim.cmd [[
      autocmd TermEnter term://*toggleterm#*
            \ tnoremap <silent><C-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
   ]]
end

function M.run ()
   map.set('n', '<C-t>', map.cmd('ToggleTerm'))

   -- fix some highlights
   highlight('StatusLineNC', { guibg = hi.get_bg('StatusLine') }, false)

   M.allow_exit()
end

return M
