local M = {}
local present, pywal = pcall(require, 'pywal')

if not present then
  return {
    enable = function ()
      print('[WARN/pywal]: Cannot import pywal')
    end
  }
end

function M.enable ()
  pywal.setup()
end

return M
