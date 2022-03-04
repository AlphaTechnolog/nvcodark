local toload = {'buffers', 'files', 'insert', 'windows'}
for _, filename in ipairs(toload) do
  require('mappings.' .. filename)
end
