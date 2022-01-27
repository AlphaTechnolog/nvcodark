local M = {}
local config = require('config')
local present, material = pcall(require, 'material')
local tables = require('utils.tables')

if not present then
  return {
    enable = function ()
      error('[WARN/plugins/material] Cannot import material')
    end
  }
end

function M.get_options ()
  return {
    disable = {
      borders = true,
      eob_lines = true,
    },
  }
end

function M.enable ()
  local material_conf = config.plugins.specify.material or {}
  vim.g.material_style = material_conf.style
  vim.opt.termguicolors = true
  material.setup(tables.extend(M.get_options(), material_conf.options or {}))
  vim.cmd [[ colorscheme material ]]
end

return M
