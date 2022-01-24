local M = {}
local present, cosmic_ui = pcall(require, 'cosmic-ui')

if not present then
  error('[WARN/plugins/cosmic-ui] Cannot import cosmic ui')
end

function M.setup ()
  cosmic_ui.setup({
    border_style = 'rounded',
  })
end

return M
