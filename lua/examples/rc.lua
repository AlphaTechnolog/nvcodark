local colorschemes = require "nvcodark.tools.colorschemes"
local vars = require "nvcodark.tools.vars"
local autocmd = require "nvcodark.tools.autocmd"
local presets = require "nvcodark.presets"
local map = require "nvcodark.tools.map"
local plugcnf = require "nvcodark.tools.plugcnf"

-- adds support to nim files
--[[ SNIP

local plugins = require "nvcodark.plugins"

plugins.push_plugin {
    'alavis/nim.nvim',
    ft = 'nim'
}

-- ENDSNIP ]]

-- lsp
plugcnf.create('lsp', {
    load_signature = true,
    servers = {
        -- nimls = 'inherit', -- add intellisense and lsp-stuff to nim files
        pylsp = 'inherit',
        tsserver = 'inherit',
        sumneko_lua = function (server, attach, capabilities, flags)
            server.setup {
                on_attach = attach,
                capabilities = capabilities,
                flags = flags,
                settings = {
                    Lua = {
                        runtime = {
                            version = 'LuaJIT',
                        },
                        diagnostics = {
                            globals = {'vim'},
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file('', true),
                        },
                        telemetry = {
                            enable = true,
                        }
                    }
                }
            }
        end
    }
})

-- presets loading
presets.load_presets({
   'vars.defaults',
   'mappings.insert',
   'mappings.windowsnav',
   'mappings.buffers',
   'mappings.plugins',
   'mappings.terminal'
})

-- vars
vars.single_scope_multiple('opt', {
   -- to make cursor underline
   -- guicursor = 'i:hor10',
   laststatus = 3, -- global statusline
})

-- colorschemes
colorschemes.load_template('decay', {
    settings = {
        style = 'decayce',
        italics = {
            code = false,
            comments = true,
        },
        cmp = {
            block_kind = true,
        },
        nvim_tree = {
            contrast = true,
        }
    }
})

-- autocmds
autocmd.FileType = {
   'lua',
   function ()
      vars.single_scope_multiple('opt', {
        tabstop = 4,
        shiftwidth = 4,
        expandtab = true
      })
   end
}

-- cursors fixes at nvim exit

-- uncomment this if your terminal cursor is beam
-- autocmd.VimLeave = function ()
--    vars.load('opt', 'guicursor', 'n:ver10')
-- end

-- uncomment this if your terminal cursor is underline
-- autocmd.VimLeave = function ()
--    vars.load('opt', 'guicursor', 'n:hor10')
-- end

-- disable fold in nim files
autocmd.FileType = {
   'nim',
   function ()
      vars.load('opt', 'foldenable', false)
   end
}

-- additional mappings
map.bulk {
   n = {
      {"<C-s>", map.cmd("w!")},
      {"<C-q>", map.cmd("qa!")},
      {"<leader>fs", map.cmd('w!')},
      {'<leader>fg', map.cmd('Telescope live_grep')},
      {'<leader>ff', map.cmd('Telescope find_files')},
      {'<leader>fq', map.cmd('qa!')},
   }
}
