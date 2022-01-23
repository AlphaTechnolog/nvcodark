local M = {}
local map = vim.api.nvim_set_keymap

M.mappings = function ()
  map('n', '<C-n>', ':NvimTreeToggle<cr>', { noremap = true, silent = true })
end

return M
