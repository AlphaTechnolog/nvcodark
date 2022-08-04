local present, articblush = pcall(require, 'articblush')
local plugins = require 'nvcodark.plugins'

local theme = {}

-- push articblush to plugins table
plugins.push_plugin('articblush/articblush.nvim')

-- lualine
theme.lualine_theme = 'articblush'

-- cancel all if articblush ins't installed yet
if not present then
    return
end

-- theme configuration, just the default options that will be passed to `articblush.setup`
theme.default_cnf = {
    italics = {
        code = false,
        comments = false
    },
    nvim_tree = {
        contrast = true,
    }
}

-- setup articblush
function theme.setup (conf)
    articblush.setup(conf or theme.default_cnf)
end

-- done
return theme
