local M = {}
local present, neoscroll = pcall(require, 'neoscroll')

if not present then
  return {
    setup = function ()
      error('[WARN/plugins/neoscroll]: Cannot import neoscroll, so i\'ll disable the smooth scrolling.')
    end
  }
end

function M.setup ()
  neoscroll.setup({
    stop_eof = false,
    respect_scrollof = false,
  })
end

return M
