local M = {}
local map = vim.api.nvim_set_keymap

function M.mappings()
  map('n', '<C-p>', ':Telescope find_files<cr>', { noremap = true, silent = true })
end

return M
