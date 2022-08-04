local M = {}
local map = require("nvcodark.tools.map")
local hi = require "nvcodark.utils.hi"
local highlight = vim.highlight.create

function M.mappings ()
   map.set('n', '<C-n>', map.cmd('NvimTreeToggle'))
end

function M.highlights ()
   local bg = nil
   if vim.opt.laststatus:get() == 3 then
      bg = hi.get_bg('Normal')
   else
      bg = hi.get_bg('NvimTreeNormal')
   end
   highlight('NvimTreeStatusLine', { guibg = bg }, false)
   highlight('NvimTreeStatusLineNC', { guibg = bg }, false)
end

function M.setup ()
   local present, ntree = pcall(require, 'nvim-tree')
   if not present then
      return
   end

   ntree.setup({
      disable_netrw = true,
      hijack_netrw = true,
      update_focused_file = {
         enable = true,
         update_cwd = false,
      },
      git = {
         enable = true,
         ignore = true
      },
      actions = {
         open_file = {
            resize_window = true,
         },
      },
      filesystem_watchers = {
         enable = true,
      },
      view = {
         side = 'left',
         width = 28,
         hide_root_folder = true,
      },
      renderer = {
         highlight_git = true,
         highlight_opened_files = 'none',

         indent_markers = {
            enable = false,
         },

         icons = {
            show = {
               file = true,
               folder = true,
               folder_arrow = true,
               git = true,
            },

            glyphs = {
               default = "",
               symlink = "",
               folder = {
                  default = "",
                  empty = "",
                  empty_open = "",
                  open = "",
                  symlink = "",
                  symlink_open = "",
                  arrow_open = "",
                  arrow_closed = "",
               },
               git = {
                  unstaged = "✗",
                  staged = "✓",
                  unmerged = "",
                  renamed = "➜",
                  untracked = "★",
                  deleted = "",
                  ignored = "◌",
               },
            }
         },
      },
   })

   M.highlights()
end

return M
