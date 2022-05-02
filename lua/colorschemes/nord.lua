local M = {}
local hi = vim.highlight.create

function M.get_palette ()
  return {
    bg = '#2E3440',
  }
end

function M.custom_his()
  local palette = M.get_palette()
  hi('NvimTreeStatusLineNC', { guibg = palette.bg }, false)
  hi('NvimTreeEndOfBuffer', { guibg = palette.bg, guifg = palette.bg }, false)
  hi('EndOfBuffer', { guibg = palette.bg, guifg = palette.bg }, false)
end

function M.enable ()
  vim.cmd [[ colorscheme nord ]]
  M.custom_his()
end

return M
