local M = {}

local sep = vim.loop.os_uname().sysname == "Windows_NT" and [[\]] or [[/]]
function M.join(...)
  return table.concat({ ... }, sep)
end

return M
