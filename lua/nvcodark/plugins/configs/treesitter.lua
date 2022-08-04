local M = {}
local present, cfg = pcall(require, 'nvim-treesitter.configs')

if not present then
   return { setup = function () end }
end

function M.setup ()
   cfg.setup {
      ensure_installed = {
         "lua",
         "vim",
      },
      highlight = {
         enable = true,
         use_languagetree = true,
      },
      indent = {
         enable = true,
      }
   }
end

return M
