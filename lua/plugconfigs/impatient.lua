local present, impatient = pcall(require, 'impatient')
local mkerror = require('utils.mkerror')
local M = {}

if not present then
  return mkerror.warn({
    plugin = 'impatient',
    msg = 'Cannot import impatient, disabling cache'
  })
end

function M.setup ()
  impatient.enable_profile()
end

return M
