local M = {}
local hi = vim.highlight.create
local config = require('config')

function M.get_palette ()
  return {
    fg = '#dadada',
    bg = '#181f21',
    black = '#22292b',
    darkbg = '#151b1d',
    red = '#e06e6e',
    green = '#8ccf7e',
    yellow = '#e5c76b',
    blue = '#67b0e8',
    magenta = '#c47fd5',
    cyan = '#6cd0ca',
    white = '#b3b9b8',
  }
end

function M.h (str, opts)
  hi(str, opts, false)
end

function M.custom_highlights (palette)
  M.h('EndOfBuffer', { guibg = palette.bg, guifg = palette.bg })
  M.h('VertSplit', { guibg = palette.bg, guifg = palette.black })
  M.h('NvimTreeVertSplit', { guibg = palette.bg, guifg = palette.black })

  if not config.plugins.specify.everblush.borders then
    M.h('VertSplit', { guifg = palette.bg })
    M.h('NvimTreeVertSplit', { guifg = palette.bg })
  end

  M.h('NvimTreeEndOfBuffer', { guibg = palette.bg, guifg = palette.bg })
  M.h('NvimTreeStatusLine', { guibg = palette.bg })
  M.h('NvimTreeStatusLineNC', { guibg = palette.bg })
  M.h('StatusLine', { guibg = palette.bg })
  M.h('TelescopeBorder', { guifg = palette.black })
end

function M.apply_tree_contrast (palette)
  M.h('NvimTreeNormal', { guibg = palette.darkbg })
  M.h('NvimTreeNormalNC', { guibg = palette.darkbg })
  M.h('NvimTreeEndOfBuffer', { guibg = palette.darkbg, guifg = palette.darkbg })
  M.h('NvimTreeVertSplit', { guibg = palette.darkbg })
  M.h('NvimTreeStatusLine', { guibg = palette.darkbg })
  M.h('NvimTreeStatusLineNC', { guibg = palette.darkbg })
end

function M.enable ()
  vim.cmd [[ colorscheme everblush ]]
  M.custom_highlights(M.get_palette())
  if config.plugins.specify.everblush.tree_contrast then
    M.apply_tree_contrast(M.get_palette())
  end
end

return M
