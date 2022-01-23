local M = {}
local config = require('config')

function M.autocmds ()
  if config.plugins.specify.nvim_tree.open_at_startup then
    vim.cmd [[ autocmd VimEnter * NvimTreeToggle ]]
  end
end

return M
