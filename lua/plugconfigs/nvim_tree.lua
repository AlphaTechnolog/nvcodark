local present, ntree = pcall(require, 'nvim-tree')

if not present then
  return {
    setup = function ()
      error('[ERROR/plugins/configs/nvim-tree]: Cannot import nvim-tree module')
    end
  }
end

local M = {}

function M.get_options ()
  return {
    disable_netrw       = true,
    hijack_netrw        = true,
    open_on_setup       = false,
    ignore_ft_on_setup  = {},
    auto_close          = false,
    open_on_tab         = false,
    hijack_cursor       = false,
    update_cwd          = true,
    update_to_buf_dir   = {
      enable = true,
      auto_open = true,
    },
    diagnostics = {
      enable = true,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      }
    },
    update_focused_file = {
      enable      = true,
      update_cwd  = true,
      ignore_list = {}
    },
    system_open = {
      cmd  = nil,
      args = {}
    },
    filters = {
      dotfiles = false,
      custom = {}
    },
    git = {
      enable = true,
      ignore = false,
      timeout = 500,
    },
    view = {
      width = 30,
      height = 30,
      hide_root_folder = true,
      side = 'left',
      auto_resize = true,
      mappings = {
        custom_only = false,
        list = {}
      },
      number = false,
      relativenumber = false,
      signcolumn = "yes"
    }
  }
end

function M.setup_opts ()
  vim.g.nvim_tree_indent_markers = 1
  vim.g.nvim_tree_add_trailing = 0
  vim.g.nvim_tree_highlight_opened_files = 0
  vim.g.nvim_tree_icons = {
    default = "",
    symlink = "",
    git = {
      deleted = "",
      ignored = "◌",
      renamed = "➜",
      staged = "✓",
      unmerged = "",
      unstaged = "✗",
      untracked = "★",
    },
    folder = {
      default = "",
      empty = "",
      empty_open = "",
      open = "",
      symlink = "",
      symlink_open = "",
    },
  }
end

function M.setup ()
  M.setup_opts()
  ntree.setup(M.get_options())
end

return M
