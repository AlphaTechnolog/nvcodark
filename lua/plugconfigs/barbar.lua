local M = {}
local hi = vim.highlight.create
local his = require('utils.his')

function M.setup ()
  hi('BufferTabpages', { guibg = his.get_bg('NvimTreeNormal'), guifg = his.get_fg('NvimTreeNormal') }, false)
  hi('BufferTabpageFill', { guibg = his.get_bg('NvimTreeNormal'), guifg = his.get_fg('NvimTreeNormal') }, false)

  vim.g.bufferline = {
    exclude_ft = {},
    exclude_name = {},
    icon_separator_inactive = ' ',
  }
end

return M
