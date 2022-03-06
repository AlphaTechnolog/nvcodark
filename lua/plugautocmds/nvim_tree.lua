local M = {}
local config = require('config')

function M.hide_statusline ()
  local buftype = vim.api.nvim_buf_get_option(0, 'ft')
  local set_opt = vim.api.nvim_set_option
  if buftype == 'NvimTree' or buftype == 'toggleterm' then
    vim.cmd [[ setlocal statusline=%!DisableST() ]]
    set_opt('laststatus', 0)
    return
  end
  set_opt('laststatus', 2)
end

function M.autocmds ()
  if config.plugins.specify.nvim_tree.open_at_startup then
    vim.cmd [[ autocmd VimEnter * NvimTreeToggle ]]
  end
  if config.plugins.specify.nvim_tree.hide_statusline then
    vim.cmd [[
      function! DisableST()
        return " "
      endfunction
    ]]
    vim.cmd [[ autocmd BufEnter * lua require('plugautocmds.nvim_tree').hide_statusline() ]]
  end
end

return M
