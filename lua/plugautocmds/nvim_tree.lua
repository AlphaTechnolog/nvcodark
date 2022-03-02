local M = {}
local config = require('config')

function M.hide_statusline ()
  local buftype = vim.api.nvim_buf_get_option(0, 'ft')
  local set_opt = vim.api.nvim_set_option
  if buftype == 'NvimTree' then
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
    vim.cmd [[ autocmd BufEnter * lua require('plugautocmds.nvim_tree').hide_statusline() ]]
    vim.cmd [[
      function! DisableST()
        return " "
      endfunction
      au BufEnter NvimTree setlocal statusline=%!DisableST()
    ]]
  end
end

return M
