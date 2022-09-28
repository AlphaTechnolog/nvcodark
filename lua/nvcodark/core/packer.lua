local fn = vim.fn

local M = {}
local vim_tools = require "nvcodark.utils.vim"
local functions = require "nvcodark.utils.functions"


local pack_dir = join_paths(get_runtime_dir(), "site", "pack")
local packer_install_dir = join_paths(pack_dir, "packer", "start", "packer.nvim")
local compile_path = join_paths(get_config_dir(), "plugin", "packer_compiled.lua")

function M.bootstrap()
  -- Automatically install packer
  if fn.empty(fn.glob(packer_install_dir)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      packer_install_dir,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
  end
end

M.options = {
  auto_clean = true,
  compile_on_sync = true,
  package_root = pack_dir,
  compile_path = compile_path,
  git = { clone_timeout = 6000 },
  display = {
    working_sym = "ﲊ",
    error_sym = "✗ ",
    done_sym = " ",
    removed_sym = " ",
    moved_sym = "",
    open_fn = function()
      return require("packer.util").float { border = "single" }
    end,
  },
}

function M.load(plugs)
  local ok, packer = pcall(require, "packer")

  if not ok then
    return
  end

  vim.cmd [[ packadd packer.nvim ]]

  packer.init(M.options)

  packer.startup(function(use)
    use "wbthomason/packer.nvim"
    for _, plug in ipairs(plugs) do
      use(plug)
    end
  end)
end

return M
