local M = {}
local map = vim.api.nvim_set_keymap
local tables = require('utils.tables')

function M.cmd (str)
  return '<cmd>' .. str .. '<cr>'
end

function M.set (mode, mapping, to_exe, options)
  local base_options = { noremap = true, silent = true }
  local opts = tables.extend(base_options, options or {})
  map(mode, mapping, to_exe, opts)
end

return M
