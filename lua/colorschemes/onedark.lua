local M = {}
local present, onedark = pcall(require, 'onedark')
local config = require('config')
local tbls = require('utils.tables')

if not present then
  return {
    enable = function ()
      error('[WARN/plugins/onedark]: Cannot import onedark')
    end
  }
end

function M.get_opts()
  local sidebars = {'NvimTree', 'packer', 'terminal', 'qf', 'vista_kind'}
  local opts = { sidebars = sidebars }
  -- loading custom configuration for onedark in lua/rc.lua file
  opts = tbls.extend(opts, config.plugins.specify.onedark.custom_opts or {})
  if config.plugins.specify.onedark.darker then
    local keys = {'black', 'bg', 'bg2', 'darker_black', 'black2', 'bg_sidebar', 'bg_statusline'}
    opts.colors = {}
    for _, key in ipairs(keys) do
      opts.colors[key] = '#1e222a'
    end
  end

  return opts
end

function M.enable ()
  onedark.setup(M.get_opts())
end

return M
