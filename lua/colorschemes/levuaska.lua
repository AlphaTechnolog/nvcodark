local M = {}
local present, levuaska = pcall(require, 'levuaska')
local config = require('config')
local hi = vim.highlight.create

if not present then
  return {
    enable = function ()
      print('[WARN/levuaska]: Cannot import levuaska')
    end
  }
end

function M.enable ()
  levuaska.setup(config.plugins.specify.levuaska)
end

return M
