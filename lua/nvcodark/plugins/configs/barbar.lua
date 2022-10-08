local M = {}

-- adds offset to nvim-tree
function M.add_offset()
   vim.api.nvim_create_autocmd('BufWinEnter', {
     pattern = '*',
     callback = function()
       if vim.bo.filetype == 'NvimTree' then
         require'bufferline.api'.set_offset(30, '')
       end
     end
   })

   vim.api.nvim_create_autocmd('BufWinLeave', {
     pattern = '*',
     callback = function()
       if vim.fn.expand('<afile>'):match('NvimTree') then
         require'bufferline.api'.set_offset(0)
       end
     end
   })
end

function M.autocmds ()
   M.add_offset()
end

function M.setup()
   M.autocmds()
end

return M
