local M = {}
local present, lspcolors = pcall(require, 'lsp-colors')

if not present then
  error('[WARN/plugins/lspcolors]: Cannot import lsp-colors')
end

M.setup = function ()
  lspcolors.setup({
    Error = "#db4b4b",
    Warning = "#e0af68",
    Information = "#0db9d7",
    Hint = "#10B981"
  })
end

return M
