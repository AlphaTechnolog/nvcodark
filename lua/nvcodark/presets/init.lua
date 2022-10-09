local M = {}

function M.run (mod, cfg)
   local ok, err = pcall(mod.run, cfg or nil)

   if not ok then
      error('Cannot run preset: ' .. err)
   end
end

function M.get_preset(preset)
   local loaded, res = pcall(require, 'nvcodark.presets.' .. preset)

   if not loaded then
      error('Cannot load preset ' .. preset .. ': ' .. res)
   end

   return res
end

function M.load_ordinary(preset)
   M.run(M.get_preset(preset))
end

function M.load_with_cfg(name, cfg)
   M.run(M.get_preset(name), cfg or {})
end

function M.load_preset(preset)
   if type(preset) == 'table' then
      local name, cfg = unpack(preset)

      M.load_with_cfg(name, cfg)
   else
      M.load_ordinary(preset)
   end
end

function M.load_presets(presets)
   for _, preset in ipairs(presets) do
      M.load_preset(preset)
   end
end

return M
