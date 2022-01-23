local M = {}
local present, tsitter = pcall(require, 'nvim-treesitter.configs')
local config = require('config')

if not present then
  return {
    setup = function ()
      error('[WARN/plugins/treesitter]: Cannot import nvim-treesitter')
    end
  }
end

function M.setup ()
  tsitter.setup {
    ensure_installed = config.plugins.specify.treesitter.ensure_installed,
    sync_installed = config.plugins.specify.treesitter.sync_installed,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = true,
    },
  }
end

return M
