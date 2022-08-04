local M = {}
local vars = require "nvcodark.tools.vars"

function M.exists_builtin (val)
   local exists, _ = pcall(require, 'nvcodark.tools.colorschemes.templates.' .. val)

   return exists
end

function M.load_builtin (template, cfg)
   if not M.exists_builtin(template) then
      error("Cannot load builtin theme " .. template .. ": No such file or directory")
   end

   local mod = require("nvcodark.tools.colorschemes.templates." .. template)

   if type(mod) ~= 'table' then
      return
   end

   local ok, err = pcall(mod.setup, cfg)

   vars.load('g', 'lualine_theme', mod.lualine_theme)

   if not ok then
      print("Cannot load colorscheme " .. template .. ": " .. err)
   end
end

function M.load_dict (template, cfg)
   local ok, err = pcall(template.setup, cfg)

   vars.load("g", "lualine_theme", template.lualine_theme)

   if not ok then
      error("Invalid template: " .. err)
   end
end

function M.load_template (template, cfg)
   if type(template) == 'table' then
      M.load_dict(template)
   elseif type(template) == 'string' then
      M.load_builtin(template, cfg)
   end
end

return M
