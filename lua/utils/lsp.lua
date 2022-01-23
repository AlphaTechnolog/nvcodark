local M = {}
local present, cmp = pcall(require, 'cmp_nvim_lsp')
local config = require('config')

if not present then
  return {
    get_capabilities = function ()
      error('[ERR/utils/lsp]: Cannot import nvim-cmp.lua')
    end
  }
end

function M.get_capabilities ()
  local base_capabilities = vim.lsp.protocol.make_client_capabilities()
  local capabilities = cmp.update_capabilities(base_capabilities)

  return capabilities
end

function M.on_attach (client, bufnr)
  local function bufmap (...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  if config.lsp.misc.signature then
    local present, signature = pcall(require, 'lsp_signature')
    if not present then
      print('[ERR/lsp]: Cannot initialize signature: cannot import lsp_signature')
    else
      signature.on_attach()
    end
  end

  local opts = { noremap = true, silent = true }

  bufmap('n', 'gd', '<cmd>lua require("telescope.builtin").lsp_definitions()<cr>', opts)
  bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  bufmap('n', 'gi', '<cmd>lua require("telescope.builtin").lsp_implementations()<cr>', opts)
  bufmap('n', 'gt', '<cmd>lua require("telescope.builtin").lsp_type_definitions()<cr>', opts)
  bufmap('n', 'gr', '<cmd>lua require("telescope.builtin").lsp_references()<cr>', opts)

  if config.lsp.misc.cosmic_ui.rename then
    bufmap('n', 'gn', '<cmd>lua require("cosmic-ui").rename()<cr>', opts)
  else
    bufmap('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
  end

  if config.lsp.misc.cosmic_ui.code_actions then
    bufmap('n', 'ga', '<cmd>lua require("cosmic-ui").code_actions()<cr>', opts)
    bufmap('v', 'ga', '<cmd>lua require("cosmic-ui").range_code_actions()<cr>', opts)
  end

  -- diagnostics
  bufmap('n', '[g', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
  bufmap('n', ']g', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
  bufmap('n', 'ge', '<cmd>lua vim.diagnostic.open_float(nil, { scope = "line", })<cr>', opts)
  bufmap('n', '<leader>ge', '<cmd>Telescope diagnostics bufnr=0<cr>', opts)

  -- hover
  bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)

  -- formatting
  bufmap('n', '<leader>gf', '<cmd>lua vim.lsp.buf.formatting()<cr>', opts)
  bufmap('v', '<leader>gf', '<cmd>lua vim.lsp.buf.range_formatting()<cr>', opts)

  -- signature help
  bufmap('n', '<C-K>', '<cmd>lua require("lsp_signature").signature()<cr>', opts)
end

return M
