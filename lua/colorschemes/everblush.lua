local M = {}
local config = require('config')

function M.enable ()
  require('everblush').setup({ nvim_tree = {
    contrast = config.plugins.specify.everblush.tree_contrast,
  }})
end

return M
