local present, tokyonight = pcall(require, 'tokyonight')
local plugins = require 'nvcodark.plugins'
local vars = require 'nvcodark.tools.vars'

local theme = {}

-- push tokyonight to plugins table
plugins.push_plugin('folke/tokyonight.nvim')

-- theme configuration, just the default options that will be passed to `tokyonight.setup`
theme.default_cnf = {
   style = 'moon',
}

-- lualine
theme.lualine_theme = 'tokyonight'

-- cancel all if tokyonight isn't installed yet
if not present then
    return
end

-- setup
function theme.setup (conf)
   -- getting config
   local cnf = conf or theme.default_cnf

   -- configuring tokyonight
   tokyonight.setup(cnf)

   -- applying tokyonight
   vim.cmd [[ colorscheme tokyonight ]]
end

-- done
return theme
