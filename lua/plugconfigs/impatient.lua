local M = {}
local present, impatient = require('impatient')

function M.setup ()
  if present then
    impatient.enable_profile()
  end
end

return M
