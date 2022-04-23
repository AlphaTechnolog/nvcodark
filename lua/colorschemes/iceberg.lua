local M = {}
local hi = vim.highlight.create

local palette = {
  bg = '#161821',
  gutter = '#1E2132',
  light = '#6b7089',
}

function M.enable ()
  vim.cmd [[ colorscheme iceberg ]]

  local bg = { guibg = palette.bg }

  local his = {
    EndOfBuffer = { guifg = palette.bg, guibg = palette.bg },
    StatusLine = bg,
    StatusLineNC = bg,
    NvimTreeStatusLine = bg,
    NvimTreeStatusLineNC = bg,
    NvimTreeVertSplit = { guifg = palette.bg, guibg = palette.bg },
    VertSplit = { guifg = palette.bg, guibg = palette.bg },
    TelescopeBorder = { guifg = palette.light },
    LineNr = { guifg = palette.light, guibg = palette.bg },
    IndentBlanklineChar = { guifg = palette.light },
    NvimTreeIndentMarker = { guifg = palette.light },
  }

  -- applying highlights
  for highlight, opts in pairs(his) do
    hi(highlight, opts)
  end
end

return M
