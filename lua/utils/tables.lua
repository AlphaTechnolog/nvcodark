local M = {}

function M.extend (to_extend, extension)
  for key, val in pairs(extension) do
    to_extend[key] = val
  end

  return to_extend
end

return M
