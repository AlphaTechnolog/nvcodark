local present, _ = pcall(require, 'tokyonight')
local plugins = require 'nvcodark.plugins'
local vars = require 'nvcodark.tools.vars'

local theme = {}

-- push tokyonight to plugins table
plugins.push_plugin('folke/tokyonight.nvim')

-- lualine
theme.lualine_theme = 'tokyonight'

-- cancel all if tokyonight isn't installed yet
if not present then
    return
end

-- setup
function theme.setup (variables)
    -- tokyonight is configured using vim variables, loading they
    vars.load_table(variables or {})

    -- loading tokyonight
    vim.cmd [[ colorscheme tokyonight ]]
end

-- done
return theme
