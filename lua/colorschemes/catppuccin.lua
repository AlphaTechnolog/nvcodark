local M = {}
local present, catppuccin = pcall(require, 'catppuccin')

if not present then
  return {
    enable = function ()
      print('[WARN/catppuccin]: Cannot import catppuccin')
    end
  }
end

function M.enable ()
  vim.cmd [[ colorscheme catppuccin ]]
end

return M
