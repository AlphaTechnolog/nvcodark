local M = {}
local opt = vim.opt
local g = vim.g

function M.init ()
  -- write your general options like:
  opt.clipboard = 'unnamed' -- unnamedplus does not work in some systems, use unnamed instead
  g.mapleader = ' ' -- set mapleader to space (default: \)
end

return M
