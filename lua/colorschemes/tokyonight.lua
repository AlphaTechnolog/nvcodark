local M = {}
local present, tokyonight = pcall(require, 'tokyonight')

if not present then
  return {
    enable = function ()
      print('[WARN/tokyonight]: Cannot import tokyonight')
    end
  }
end

function M.enable ()
  vim.g.tokyonight_style = 'night'
  vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
  vim.cmd [[ colorscheme tokyonight ]]
end

return M
