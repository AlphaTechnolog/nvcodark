local map = vim.api.nvim_set_keymap

map('n', '<Tab>', ':bn!<cr>', { noremap = true, silent = true })
map('n', '<S-Tab>', ':bp!<cr>', { noremap = true, silent = true })
map('n', '<C-b>', ':bd!<cr>', { noremap = true, silent = true })

map('n', '<C-s>', ':w!<cr>', { noremap = true, silent = true })
map('n', '<C-q>', ':wq!<cr>', { noremap = true, silent = true })

-- insert modes to normal
local keys = { 'jk', 'kj', 'jj', 'kk' }
for _, key in ipairs(keys) do
  map('i', key, '<esc>', { noremap = true, silent = true })
end

-- windows navigation
local keys = { 'h', 'j', 'k', 'l' }
for _, key in ipairs(keys) do
  map('n', '<C-' .. key .. '>', '<C-w>' .. key, { noremap = true, silent = true })
end
