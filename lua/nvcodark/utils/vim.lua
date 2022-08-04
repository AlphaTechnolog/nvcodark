local M = {}

function M.get (val)
   return vim[val]
end

function M.get_all (vals)
   local processed = {}

   for _, val in ipairs(vals) do
      table.insert(processed, M.get(val))
   end

   return unpack(processed)
end

return M