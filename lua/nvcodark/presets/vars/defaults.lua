local M = {}
local vars = require "nvcodark.tools.vars"

function M.run ()
   vars.load_table({
      opt = {
         tabstop = 2,
         shiftwidth = 2,
         expandtab = true,
         smartindent = false,
         autoindent = true,

         regexpengine = 1,

         number = true,
         cursorline = true,

         mouse = 'a',
         clipboard = 'unnamedplus',

         wrap = false,
         showmode = false,

         termguicolors = true,
      },
      g = {
         mapleader = ' ',
      },
   })
end

return M
