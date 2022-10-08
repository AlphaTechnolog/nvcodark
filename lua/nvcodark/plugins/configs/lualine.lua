local M = {}
local present, lualine = pcall(require, 'lualine')
local str = require "nvcodark.utils.str"
local tables = require "nvcodark.utils.tables"
local hi = require "nvcodark.utils.hi"
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

   hi.override('StatusLine', { bg = hi.get_bg('Normal'), fg = hi.get_fg('Normal') })
   hi.override('IndentBlanklineChar', { bg = hi.get_bg('Normal'), fg = hi.get_fg('Normal') })

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

-- nvchad-based style (not 100% equal to nvchad one)
function M.get_nvchad_sections ()
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
               local is_special = tables.contains(exceptions, filetype)
               local webdevicons = require 'nvim-web-devicons'

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

function M.get_default_sections()
   return {
      lualine_a = {
         {
            function ()
               return ''
            end,
            separator = { left = nil, right = '' },
            color = { bg = hi.get_bg('CursorLine'), fg = hi.get_fg('Directory') }
         },
         {
            'mode',
            separator = { left = nil, right = '' }
         },
         {
            function ()
               local pwd = str.split(vim.loop.cwd(), '/')
               local wdir = pwd[#pwd]

               return ' ' .. wdir
            end,
            separator = { left = nil, right = '' },
            color = { bg = hi.get_bg('CursorLine'), fg = hi.get_fg('Directory') }
         },
         {
            'branch',
            icon = '',
            color = { bg = hi.get_bg('StatusLine'), fg = hi.get_fg('Directory') },
            separator = { left = nil, right = '' }
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
         },
      },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {
         {
            'diagnostics',
            sources = { 'nvim_diagnostic' },
            separator = { left = '', right = '' },
            diagnostics_color = {
               error = { fg = hi.get_bg('StatusLine'), bg = hi.get_fg('DiagnosticError') },
               warn = { fg = hi.get_bg('StatusLine'), bg = hi.get_fg('DiagnosticWarn') },
               info = { fg = hi.get_bg('StatusLine'), bg = hi.get_fg('DiagnosticInfo') },
               hint = { fg = hi.get_bg('StatusLine'), bg = hi.get_fg('DiagnosticHint') },
            },
            symbols = {
               error = ' ',
               warn = ' ',
               info = ' ',
               hint = ' ',
            },
            colored = true,
            update_in_insert = true,
            always_visible = false,
         },
         {
            function ()
               return ''
            end,
            color = 'Normal',
            separator = { left = nil, right = nil }
         },
         {
            'location',
            color = { bg = hi.get_bg('CursorLine'), fg = hi.get_fg('Normal') },
            separator = { right = nil, left = '' }
         },
         {
            function ()
               return ''
            end,
            color = { bg = hi.get_fg('LineNr'), fg = hi.get_fg('Directory') },
            separator = { right = nil, left = '' },
         },
         {
            'hostname',
            color = { bg = hi.get_fg('LineNr'), fg = hi.get_fg('Normal') },
            separator = { right = nil, left = nil },
         },
         {
            function ()
               return ''
            end,
            color = 'lualine_a_normal',
            separator = { right = nil, left = '' },
         },
         {
            'progress',
            color = 'lualine_a_normal',
            separator = { right = nil, left = nil }
         }
      },
   }
end

function M._get_sections_by_style(style)
   if style == 'nvchad' then
      return M.get_nvchad_sections()
   elseif style == 'rounded' then
      return M.get_rounded_sections()
   else
      return M.get_default_sections()
   end
end

function M.setup ()
   local cnf = plugcnf.get('lualine')
   local section_separators = cnf.normal_section_seps or { left = '', right = ''}

   local style = cnf.style or "default"
   local sections = M._get_sections_by_style(style)

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
