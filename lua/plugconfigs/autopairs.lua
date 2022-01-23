local M = {}
local present, autopairs = pcall(require, 'nvim-autopairs')

if not present then
  return {
    setup = function ()
      error('[WARN/plugins/autopairs]: Cannot import nvim-autopairs')
    end
  }
end

function M.setup ()
  autopairs.setup()
end

return M
