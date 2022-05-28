local map = require('utils.map')

map.set('n', '<Tab>', map.cmd('BufferNext'))
map.set('n', '<S-Tab>', map.cmd('BufferPrevious'))
map.set('n', '<C-A-b>', map.cmd('BufferClose'))
