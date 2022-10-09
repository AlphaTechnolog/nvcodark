local ok, mason = pcall(require, 'mason')
local lsp = require "nvcodark.utils.lsp"
local plugcnf = require 'nvcodark.tools.plugcnf'

local function load_lspconfig ()
   local cnf = plugcnf.get('lsp')

   -- lsp imports
   local lspconfig = require 'lspconfig'
   local lspsignature = require 'lsp_signature'
   local luasnip = require 'luasnip'
   local cmp = require 'cmp'
   local lspkind = require 'lspkind'

    -- loads lspsignature
    if cnf.load_signature then
        lspsignature.setup {
            padding = ' ',
            hint_prefix = ' ',
            handler_opts = {
                border = 'double',
            },
        }
    end

   -- making capabilities
   local capabilities = require('cmp_nvim_lsp').update_capabilities(
      vim.lsp.protocol.make_client_capabilities()
   )

   -- enable lsp saga, also enables symbols in winbar
   local saga = require 'lspsaga'

   saga.init_lsp_saga {
       symbol_in_winbar = {
           in_custom = true
       }
   }

   -- loading lspsaga modules
   local diagnostics = require 'lspsaga.diagnostic'
   local action = require 'lspsaga.codeaction'
   local rename = require 'lspsaga.rename'
   local hover = require 'lspsaga.hover'
   local finder = require 'lspsaga.finder'

   -- lsp configuration, just loads on_attach and capabilities
   local lsp_conf = {
      on_attach = function (client, bufnr)
         -- lsp-related keybindings
         lsp.mkbind(bufnr, 'n', '<space>e', vim.diagnostic.open_float)
         lsp.mkbind(bufnr, 'n', '[d', diagnostics.goto_prev)
         lsp.mkbind(bufnr, 'n', ']d', diagnostics.goto_next)
         lsp.mkbind(bufnr, 'n', 'sd', diagnostics.show_line_diagnostics)
         -- lsp.mkbind(bufnr, 'n', 'gd', require('lspsaga.definition').preview_definition)
         lsp.mkbind(bufnr, 'n', 'gh', function ()
            finder:lsp_finder()
         end)
         lsp.mkbind(bufnr, 'n', 'K', function () hover:render_hover_doc() end)
         lsp.mkbind(bufnr, 'n', 'gi', vim.lsp.buf.implementation)
         lsp.mkbind(bufnr, 'n', 'rn', rename.lsp_rename)
         lsp.mkbind(bufnr, 'n', '<space>ca', function ()
            action:code_action()
         end)
      end,
      flags = {
         debounce_text_changes = 150,
      }
   }

    -- getting servers to load
    local servers = cnf.servers or {}

    -- loads servers
    for server, setup in next, servers do
        if setup == 'inherit' then
            lspconfig[server].setup {
                on_attach = lsp_conf.on_attach,
                flags = lsp_conf.flags,
                capabilities = capabilities,
            }
        else
            setup(lspconfig[server], lsp_conf.on_attach, capabilities, lsp_conf.flags)
        end
    end

   -- cmp: configuration for a beautiful completion menu
   cmp.setup {
      window = {
         completion = {
            winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,Search:None',
            col_offset = - 3,
            side_padding = 0,
         },
      },
      formatting = {
         fields = { 'kind', 'abbr', 'menu' },
         format = function (entry, vim_item)
            local kind = lspkind.cmp_format({
               mode = 'symbol_text',
               max_width = 50
            })(entry, vim_item)

            local strings = vim.split(kind.kind, '%s', { trimempty = true })

            local mappings = {
               TypeParameter = '',
            }

            -- apply mappings to strings[1]
            for name, icon in pairs(mappings) do
               if name == strings[1] then
                  strings[1] = icon
               end
            end

            kind.kind = ' ' .. strings[1] .. ' '

            if #strings > 1 then
               kind.menu = '    (' .. strings[2] .. ')'
            end

            return kind
         end
      },
      snippet = {
         expand = function (args)
            luasnip.lsp_expand(args.body)
         end
      },
      mapping = cmp.mapping.preset.insert {
         ['<C-d>'] = cmp.mapping.scroll_docs(-4),
         ['<C-f>'] = cmp.mapping.scroll_docs(4),
         ['<C-Space>'] = cmp.mapping.complete(),
         ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
         },
         ['<Tab>'] = cmp.mapping(function (fallback)
            if cmp.visible () then
               cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
               luasnip.expand_or_jump()
            else
               fallback()
            end
         end, {'i', 's'}),
         ['<S-Tab>'] = cmp.mapping(function (fallback)
            if cmp.visible() then
               cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
               luasnip.jump(-1)
            else
               fallback()
            end
         end, {'i', 's'}),
      },
      sources = {
         { name = 'nvim_lsp' },
         { name = 'luasnip' },
      },
   }

   -- line gutter decorations
   local signs = cnf.signs or {
      Error = "",
      Warn = "",
      Hint = "",
      Info = "",
   }

   for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
   end
end

local function load_mason ()
   mason.setup({
      ui = {
         icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
         }
      }
   })
end

local function load_mason_lspconfig()
   require('mason-lspconfig').setup {
      ensure_installed = {'pylsp', 'tsserver', 'sumneko_lua'}
   }
end

local function setup_mason ()
   load_mason()
   load_mason_lspconfig()
   load_lspconfig()
end

if not ok then
   print('Cannot import mason, make sure u installed it')
else
   setup_mason()
end
