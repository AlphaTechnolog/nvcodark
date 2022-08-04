local present, onedark = pcall(require, 'onedark')
local plugins = require 'nvcodark.plugins'

local theme = {}

-- push onedark to plugins table
plugins.push_plugin('navarasu/onedark.nvim')

-- lualine
theme.lualine_theme = 'onedark'

-- cancel all if onedark isn't installed yet
if not present then
    return
end

-- theme configuration, just the default options that will be passed to `onedark.setup`
theme.default_cnf = {
    style = 'dark',
}

-- setup onedark
function theme.setup (conf)
    onedark.setup(conf or theme.default_cnf)
    onedark.load()
end

-- done
return theme
