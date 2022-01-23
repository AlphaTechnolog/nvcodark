local M = {}

function M.get_config()
  local present, rc = pcall(require, 'rc')
  if present then
    return rc
  end
  return require('default_rc')
end

return M.get_config()
