local M = {}
local present, feline = pcall(require, 'feline')

local err = function (msg)
  return {
    setup = function ()
      error(msg)
    end
  }
end

if not present then
  return err('feline')
end

local present, night_feline = pcall(require, 'night.feline')

if not present then
  return err('night')
end

function M.setup ()
  feline.setup({
    components = night_feline,
  })
end

return M
