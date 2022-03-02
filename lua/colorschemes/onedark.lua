local M = {}
local present, onedark = pcall(require, 'onedark')
local config = require('config')
local tbls = require('utils.tables')
local hi = vim.highlight.create

if not present then
  return {
    enable = function ()
      error('[WARN/plugins/onedark]: Cannot import onedark')
    end
  }
end

function M.get_darker_palette ()
  return {
    dark = '#1e222a',
    soft = '#282c34',
    fg = '#5c6370',
    blue = '#61afef'
  }
end

-- apply custom highlights to solve fg_gutter problems
function M.darker_highlights ()
  local palette = M.get_darker_palette()

  hi('LineNr', { guifg = palette.fg }, false)
  hi('Comment', { guifg = palette.fg }, false)
end

function M.load_darker_palette (opts)
  local keys = {
    'black', 'bg', 'bg2',
    'darker_black', 'black2',
    'bg_sidebar', 'bg_statusline',
  }
  opts.colors = {}
  local palette = M.get_darker_palette()
  for _, key in ipairs(keys) do
    opts.colors[key] = palette.dark
  end
  opts.colors.fg_gutter = palette.soft

  return opts
end

function M.get_opts()
  local sidebars = {'NvimTree', 'packer', 'terminal', 'qf', 'vista_kind'}
  local opts = { sidebars = sidebars }
  -- loading custom configuration for onedark in lua/rc.lua file
  opts = tbls.extend(opts, config.plugins.specify.onedark.custom_opts or {})
  if config.plugins.specify.onedark.darker then
    opts = M.load_darker_palette(opts)
  end

  return opts
end

function M.custom_nvimtree_folder_icons ()
  local palette = M.get_darker_palette()
  hi('NvimTreeFolderIcon', { guifg = palette.blue }, false)
end

function M.enable ()
  onedark.setup(M.get_opts())
  if config.plugins.specify.onedark.darker then
    M.darker_highlights()
  end
  if config.plugins.specify.onedark.custom_folder_icons then
    M.custom_nvimtree_folder_icons()
  end
end

return M
