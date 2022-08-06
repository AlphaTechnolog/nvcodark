local present, everblush = pcall(require, 'everblush')
local plugins = require 'nvcodark.plugins'

local theme = {}

-- push everblush to plugins table
plugins.push_plugin('everblush/everblush.nvim')

-- lualine
theme.lualine_theme = 'everblush'

-- cancel all if everblush isn't installed yet
if not present then
    return
end

-- theme configuration (default opts)
theme.default_cnf = {
    nvim_tree = {
        contrast = true,
    }
}

-- setup theme
function theme.setup (conf)
    everblush.setup(conf or theme.default_cnf)
end

-- done
return theme
