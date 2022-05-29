local M = {}
local present, toggleterm = pcall(require, 'toggleterm')
local map = require('utils.map')

if not present then
  error('[WARN/plugins/toggleterm]: Cannot import toggleterm')
end

function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
end

function M.autocmds ()
  vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

  vim.cmd [[
    function! DisableST()
      return " "
    endfunction
    au BufEnter toggleterm setlocal statusline=%!DisableST()
  ]]
end

function M.open_horizontal ()
  -- retoggling nvim tree and opening terminal
  vim.cmd [[ NvimTreeClose ]]
  vim.cmd [[ ToggleTerm direction=horizontal ]]
  vim.cmd [[ NvimTreeOpen ]]
  -- navigating to the terminal
  vim.cmd [[ wincmd l ]]
  vim.cmd [[ wincmd j ]]
end

function M.mappings ()
  map.set('n', '<C-t>', map.cmd('ToggleTerm direction=horizontal'))
  map.set('n', '<C-M-t>', map.cmd('lua require("plugconfigs.toggleterm").open_horizontal()')) -- dangerous
  map.set('n', '<C-v>', map.cmd('ToggleTerm direction=vertical'))
  map.set('n', '<C-f>', map.cmd('ToggleTerm direction=float'))
end

function M.setup ()
  toggleterm.setup {
    -- size can be a number or function which is passed the current terminal
    size = function(term)
      if term.direction == "horizontal" then
        return 10
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
      end
    end,
    hide_numbers = true, -- hide the number column in toggleterm buffers
    shade_filetypes = {},
    shade_terminals = false,
    start_in_insert = true,
    insert_mappings = true, -- whether or not the open mapping applies in insert mode
    terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
    persist_size = true,
    direction = 'horizontal',
    close_on_exit = true, -- close the terminal window when the process exits
    shell = vim.o.shell, -- change the default shell
    -- This field is only relevant if direction is set to 'float'
    float_opts = {
      -- The border key is *almost* the same as 'nvim_open_win'
      -- see :h nvim_open_win for details on borders however
      -- the 'curved' border is a custom border type
      -- not natively supported but implemented in this plugin.
      border = 'curved',
      width = 125,
      height = 55,
      highlights = {
        border = "TelescopeBorder", -- using telescope border
        background = "Normal",
      }
    }
  }

  M.autocmds()
  M.mappings()
end

return M
