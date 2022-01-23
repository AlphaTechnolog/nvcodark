local M = {}
local present, lspinstaller = pcall(require, 'nvim-lsp-installer.servers')
local config = require('config')
local lsp_utils = require('utils.lsp')
local tables = require('utils.tables')
local consts = require('consts')

if not present then
  return {
    setup = function ()
      error('[WARN/plugins/lspinstaller]: Cannot import lspinstaller')
    end
  }
end

function M.settings ()
  require('nvim-lsp-installer').settings = {
    ui = {
      icons = {
        server_installed = "✓",
        server_pending = "➜",
        server_uninstalled = "✗",
      },
    },
  }
end

function M.isempty (v)
  return v == nil
end

function M.setup ()
  for servername, options_func in pairs(config.lsp.servers) do
    local server_available, server = lspinstaller.get_server(servername)
    if server_available then
      server:on_ready(function ()
        local capabilities = lsp_utils.get_capabilities()
        local options = {
          on_attach = lsp_utils.on_attach,
          capabilities = capabilities,
        }
        if options_func ~= consts.NIL then
          options = tables.extend(options, options_func())
        end
        server:setup(options)
      end)
      if not server:is_installed() then
        server:install()
      end
    end
  end
  M.settings()
end

return M
