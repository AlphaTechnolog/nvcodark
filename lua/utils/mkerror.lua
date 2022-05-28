local M = {}

function M._base(opts, baseopts)
  opts = opts or {}
  opts.plugin = opts.plugin or 'anyplugin'
  opts.msg = opts.msg or 'no message provided'
  opts.func = opts.func or 'setup'

  baseopts = baseopts or {}
  baseopts.kind = baseopts.kind or 'UNDEFINED'

  local result = {}

  result[opts.func] = function ()
    error('[' .. baseopts.kind .. '/plugin/' .. opts.plugin .. ']: ' .. opts.msg)
  end

  return result
end

function M.warn (opts)
  return M._base(opts, { kind = 'WARN' })
end

return M
