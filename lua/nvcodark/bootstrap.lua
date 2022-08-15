local M = {}

if vim.fn.has("nvim-0.7") ~= 1 then
  vim.notify("Please upgrade your Neovim base installation. NvCoDark's requires v0.7+", vim.log.levels.WARN)
  vim.wait(5000, function()
    return false
  end)
  vim.cmd("cquit")
end

local uv = vim.loop
local path_sep = uv.os_uname().version:match("Windows") and "\\" or "/"

---Join path segments that were passed as input
---@return string
function _G.join_paths(...)
  local result = table.concat({ ... }, path_sep)
  return result
end

---Require a module in protected mode without relying on its cached value
---@param module string
---@return any
function _G.require_clean(module)
  package.loaded[module] = nil
  _G[module] = nil
  local status, requested = pcall(require, module)
  if not status then
    return
  end
  return requested
end

function _G.get_runtime_dir()
  local nvcodark_runtime_dir = join_paths(os.getenv("XDG_DATA_HOME"), "/nvcodark")
  return nvcodark_runtime_dir
end

function _G.get_config_dir()
  local nvcodark_config_dir = join_paths(os.getenv("XDG_CONFIG_HOME"), "nvcodark")
  return nvcodark_config_dir
end

---Get the full path to `$NVCODARK_CACHE_DIR`
---@return string
function _G.get_cache_dir()
  local nvcodark_cache_dir = join_paths(os.getenv("XDG_CACHE_HOME"), "nvcodark")
  return nvcodark_cache_dir
end

---Initialize the `&runtimepath` variables and prepare for startup
---@return table
function M:init(base_dir)
  self.runtime_dir = get_runtime_dir()
  self.config_dir = get_config_dir()
  self.cache_dir = get_cache_dir()
  self.pack_dir = join_paths(self.runtime_dir, "site", "pack")
  self.packer_install_dir = join_paths(self.runtime_dir, "site", "pack", "packer", "start", "packer.nvim")
  self.packer_cache_path = join_paths(self.config_dir, "plugin", "packer_compiled.lua")

  ---Get the full path to NvCoDark's base directory
  ---@return string
  function _G.get_nvcodark_base_dir()
    return base_dir
  end

  vim.cmd("set runtimepath+=~/.config/nvcodark")

  -- vim.opt.rtp:append(os.getenv "NVCODARK_RUNTIME_DIR" .. path_sep .. "nvcodark")
  vim.opt.rtp:remove(join_paths(vim.call("stdpath", "data"), "site"))
  vim.opt.rtp:remove(join_paths(vim.call("stdpath", "data"), "site", "after"))
  vim.opt.rtp:prepend(join_paths(self.runtime_dir, "site"))
  vim.opt.rtp:append(join_paths(self.runtime_dir, "site", "after"))

  vim.opt.rtp:remove(vim.call("stdpath", "config"))
  vim.opt.rtp:remove(join_paths(vim.call("stdpath", "config"), "after"))
  vim.opt.rtp:prepend(self.config_dir)
  vim.opt.rtp:append(join_paths(self.config_dir, "after"))
  vim.cmd [[let &packpath = &runtimepath]]

  return self
end

return M
