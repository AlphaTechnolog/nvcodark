local M = {}
local hi = vim.highlight.create

function M.enable ()
  vim.g.ayu_avoid_italics = true
  vim.cmd [[ colorscheme ayu ]]
  hi('Normal', { guibg = "#0A0E14" }, false)
  hi('EndOfBuffer', { guifg = '#0A0E14' }, false)
  hi('VertSplit', { guifg = '#0A0E14', guibg = '#0A0E14' }, false)
  vim.cmd [[
    au BufEnter NvimTree hi! NvimTreeNormal guibg=#0A0E14
  ]]
end

return M
