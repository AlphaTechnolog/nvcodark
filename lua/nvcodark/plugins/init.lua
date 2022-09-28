local M = {}
local packermngr = require "nvcodark.core.packer"
local plugins = require "nvcodark.plugins.default_plugs"

function M.push_plugin(plug)
  table.insert(plugins, plug)
end

function M.push_plugins(plugs)
  for _, plug in ipairs(plugs) do
    M.push_plugin(plug)
  end
end

function M.setup()
  packermngr.load(plugins)

  -- load mason configuration
  -- require "nvcodark.plugins.configs.mason"
end

return M
