local M = {}
local vars = require "nvcodark.tools.vars"
local v = require "nvcodark.utils.vim"

function M.create(plugname, conf)
   vars.load('g', plugname .. '_conf', conf)
end

function M.get(plugname)
   return v.get('g')[plugname .. "_conf"] or {}
end

return M
