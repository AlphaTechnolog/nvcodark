local M = {}
local present, lualine = pcall(require, 'lualine')
local str = require "nvcodark.utils.str"
local tables = require "nvcodark.utils.tables"
local hi = require "nvcodark.utils.hi"
local highlight = vim.highlight.create
local plugcnf = require "nvcodark.tools.plugcnf"

if not present then
   return { setup = function () end }
end

-- rounded style
function M.get_rounded_sections ()
   local left = ''
   local right = ''

   local separator = {
      function ()
         return ' '
      end,
      color = { bg = hi.get_bg('StatusLine') },
      padding = { left = 0, right = 0 }
   }

   highlight('StatusLine', { guibg = hi.get_bg('Normal'), guifg = hi.get_fg('Normal') }, false)
   highlight('StatusLineNC', { guibg = hi.get_bg('Normal'), guifg = hi.get_fg('Normal') }, false)

   return {
      lualine_a = {
         {
            'mode',
            icons_enabled = true,
            icon = { '', align = 'left' },
            padding = { left = 1, right = 1 },
            separator = { left = nil, right = right },
         },
      },
      lualine_b = {
         separator,
      },
      lualine_c = {
         {
            function ()
               return ''
            end,
            color = 'lualine_a_replace',
            padding = { left = 0, right = 1 },
            separator = { left = left, right = nil },
         },
         {
            'filename',
            symbols = {
               modified = ' ',
               readonly = ' ',
               unnamed = 'Empty'
            },
            padding = { left = 1 },
            separator = { left = nil, right = '' },
            color = "CursorLine"
         },
      },
      lualine_x = {},
      lualine_y = {
         {
            function ()
               return ''
            end,
            separator = { left = left, right = nil },
            padding = { left = 0, right = 1 },
            color = 'lualine_a_visual',
            cond = function ()
               return vim.fn.isdirectory('.git') ~= 0
            end,
         },
         {
            'branch',
            icons_enabled = false,
            separator = { left = nil, right = right },
            padding = { left = 1, right = 0 },
            color = 'CursorLine'
         },
         separator,
         {
            function ()
               return ''
            end,
            separator = { left = left, right = nil },
            padding = { left = 0, right = 1 },
            color = 'lualine_a_insert',
         },
         {
            'progress',
            separator = { left = nil, right = nil },
            padding = { left = 1, right = 1 },
            color = 'CursorLine'
         }
      },
      lualine_z = {}
   }
end

-- powerline style
function M.get_powerline_sections ()
   return {
      lualine_a = {
         {
            'mode',
            icons_enabled = true,
            icon = { '', align = 'left' },
         },
      },
      lualine_b = {
         {
            'filetype',
            colored = true,
            icon_only = true,
            padding = { left = 2, right = 1 },
            separator = { left = '', right = ''},
            color = "CursorLine",
            -- lualine filetype module is too bad to use how i want, so i'm rewriting a bit the logic
            -- of the filetype component using the function `cond` that allows me to hide it when i want.
            cond = function ()
               -- maybe others
               local exceptions = {
                  'TelescopePrompt',
                  'packer'
               }

               local filetype = vim.bo.filetype
               local is_especial = tables.contains(exceptions, filetype)
               local webdevicons = require 'nvim-web-devicons'

               -- to avoid problems
               if is_special or filetype == "" or filetype == nil then
                  return false
               end

               local filepath = str.split(vim.fn.expand('%'), '/')
               local filename = filepath[#filepath] -- get last element of filepath

               if filename == nil then
                  return false
               end

               local splitted_filename = str.ssplit(filename, '.')
               local fileext = splitted_filename[#splitted_filename] -- get last element of filename

               local icon = webdevicons.get_icon(filename, fileext)

               if icon == nil then
                  return false
               end

               return true
            end
         },
         {
            'filename',
            symbols = {
               modified = ' ',
               readonly = ' ',
               unnamed = 'Empty'
            },
            padding = { left = 2 },
            separator = { left = nil, right = '' },
            color = "Normal"
         },
      },
      lualine_c = {
         {
            'branch',
            icon = ''
         },
         {
            'diff',
            colored = true,
            diff_color = {
               added = { bg = hi.get_bg('StatusLine'), fg = hi.get_fg('DiffAdd') },
               modified = { bg = hi.get_bg('StatusLine'), fg = hi.get_fg('DiffChange') },
               removed = { bg = hi.get_bg('StatusLine'), fg = hi.get_fg('DiffDelete') },
            },
            symbols = {
               added = ' ',
               modified = ' ',
               removed = ' ',
            }
         }
      },
      lualine_x = {
         {
            'diagnostics',
            sources = { 'nvim_diagnostic' },
            symbols = {
               error = ' ',
               warn = ' ',
               info = ' ',
               hint = ' ',
            },
            colored = true,
            update_in_insert = false,
            always_visible = false,
         }
      },
      lualine_y = {
         -- hostname
         {
            function ()
               return ''
            end,
            separator = { left = '', right = nil },
            padding = { left = 0, right = 1 },
            color = 'lualine_a_replace',
         },
         {
            'hostname',
            color = { bg = hi.get_bg('StatusLine'), fg = hi.get_fg('Normal') }
         },

         {
            function ()
               return ''
            end
         },

         -- pwd
         {
            function ()
               return ' '
            end,
            separator = { left = '', right = nil },
            color = 'lualine_a_insert',
            padding = { left = 0, right = 0 },
         },
         {
            function ()
               local pwd = str.split(vim.loop.cwd(), '/')
               return pwd[#pwd]
            end,
            separator = { left = nil },
            color = { bg = hi.get_bg('StatusLine'), fg = hi.get_fg('Normal') }
         }
      },
      lualine_z = {},
   }
end

function M.setup ()
   local cnf = plugcnf.get('lualine')
   local section_separators = cnf.normal_section_seps or { left = '', right = ''}

   local style = cnf.style or "powerline_based"
   local sections = style == "powerline_based" and M.get_powerline_sections() or M.get_rounded_sections()

   lualine.setup {
      options = {
         theme = vim.g.lualine_theme or 'decay',
         section_separators = section_separators,
         component_separators = '',
         disabled_filetypes = {
            'Telescope',
            'toggleterm'
         }
      },
      sections = sections,
      inactive_sections = {
         lualine_a = {},
         lualine_b = {},
         lualine_c = {},
         lualine_x = {},
         lualine_y = {},
         lualine_z = {}
      },
   }
end

return M
