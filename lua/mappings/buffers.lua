local map = require('utils.map')

map.set('n', '<Tab>', map.cmd('BufferNext'))
map.set('n', '<S-Tab>', map.cmd('BufferPrevious'))
map.set('n', '<C-b>', map.cmd('BufferClose'))
