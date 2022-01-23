local M = {}
local present, telescope = pcall(require, 'telescope')

if not present then
  return {
    setup = function ()
      error('[WARN/plugins/telescope]: Cannot import telescope')
    end
  }
end

function M.setup ()
  telescope.setup()
end

return M
