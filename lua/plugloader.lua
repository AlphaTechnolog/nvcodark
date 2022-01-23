local M = {}
local config = require('config')
local plugins_configs = config.plugins.to_enable

function M.load_all ()
  for plugin_name, plugoptions in pairs(plugins_configs) do
    local plugconf = require('plugconfigs.' .. plugin_name)
    local ok, err = pcall(plugconf.setup)
    if not ok then
      error('[ERR/plugins/loader/' .. plugin_name .. ']: The config returned an error: ' .. err)
    end
    if plugoptions.has_mappings or false then
      local plugmappings = require('plugmappings.' .. plugin_name)
      local ok, err = pcall(plugmappings.mappings)
      if not ok then
        error('[ERR/plugins/loader/' .. plugin_name .. '] (At call maps): The config returned an error: ' .. err)
      end
    end
    if plugoptions.has_autocmds or false then
      local plugautocmds = require('plugautocmds.' .. plugin_name)
      local ok, err = pcall(plugautocmds.autocmds)
      if not ok then
        error('[ERR/plugins/loader/' .. plugin_name .. '] (At call autocmds): The config returned an error: ' .. err)
      end
    end
  end
end

return M
