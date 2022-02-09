local M = {}
local present, calvera = pcall(require, 'calvera')

if not present then
  return {
    enable = function ()
      error('[WARN/plugins/calvera]: Cannot import calvera-dark')
    end
  }
end

function M.enable ()
  vim.g.calvera_hide_eob = true
  calvera.set()
end

return M
