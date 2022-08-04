local lsp = {}

function lsp.mkbind(b, m, k, a)
   vim.keymap.set(m, k, a, {
      silent = true,
      noremap = true,
      buffer = b
   })
end

return lsp
