local M = {}
local present, colorizer = pcall(require, 'colorizer')

if not present then
  return {
    setup = function ()
      error('[WARN/plugins/colorizer]: Cannot import colorizer')
    end
  }
end

function M.setup ()
  colorizer.setup()
end

return M
