local M = {}

function M.enable ()
  require('everblush').setup({ nvim_tree = { contrast = true }})
end

return M
