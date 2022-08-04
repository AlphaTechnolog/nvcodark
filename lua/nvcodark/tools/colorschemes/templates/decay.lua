local present, decay = pcall(require, 'decay')
local plugins = require 'nvcodark.plugins'
local vars = require 'nvcodark.tools.vars'

local theme = {}

-- push decay to plugins table
plugins.push_plugin('decaycs/decay.nvim')

-- lualine
theme.lualine_theme = 'decay'

-- cancel all if decay isn't installed yet
if not present then
   return
end

-- theme configuration, just the default options that will be passed to `decay.setup`
theme.default_cnf = {
    style = 'dark',
    italics = {
        code = false,
        comments = false,
    },
    cmp = {
        block_kind = false,
    },
    nvim_tree = {
        contrast = true,
    }
}

-- setup decay
function theme.setup (conf)
    -- processing config
    local cnf = conf or { settings = theme.default_cnf, bg = 'dark' }

    -- could load light theme
    if cnf.bg then
        vars.load_table({
            o = {
                background = cnf.bg
            }
        })
    end

    -- loading decay
    decay.setup(cnf.settings or theme.default_cnf)
end

-- done
return theme
