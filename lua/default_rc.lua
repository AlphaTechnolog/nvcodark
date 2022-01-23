local config = {}
local consts = require('consts')

config.colorscheme = 'tokyonight'

config.lualine = {
  theme = 'tokyonight'
}

config.plugins = {
  to_enable = {
    nvim_tree = { has_mappings = true, has_autocmds = true },
    telescope = { has_mappings = true },
    bufferline = {},
    lualine = {},
    treesitter = {},
    colorizer = {},
    autopairs = {},
    cmp = {},
    lspinstaller = {},
    lspcolors = {},
  },
  specify = {
    nvim_tree = {
      open_at_startup = true,
    },
    treesitter = {
      ensure_installed = {
        'lua',
        'vim',
        'javascript',
        'cpp',
      },
      sync_installed = true,
    },
  },
}

config.lsp = {
  misc = {
    signature = true,
  },
  servers = {
    tsserver = consts.NIL,
    pylsp = consts.NIL,
    vuels = consts.NIL,
    clangd = consts.NIL,
    emmet_ls = consts.NIL,
    sumneko_lua = function()
      local runtime_path = vim.split(package.path, ';')
      table.insert(runtime_path, 'lua/?.lua')
      table.insert(runtime_path, 'lua/?/init.lua')

      return {
        settings = {
          Lua = {
            runtime = {
              version = 'LuaJIT',
              path = runtime_path,
            },
            diagnostics = {
              globals = {'vim'},
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
              enable = false,
            },
          }
        }
      }
    end
  },
}

return config

