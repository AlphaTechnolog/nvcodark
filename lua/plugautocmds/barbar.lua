local M = {}
local nvim_tree_events = require('nvim-tree.events')
local bufferline_state = require('bufferline.state')

function M.autocmds ()
  nvim_tree_events.on_tree_open(function ()
    bufferline_state.set_offset(31, "")
  end)

  nvim_tree_events.on_tree_close(function ()
    bufferline_state.set_offset(0)
  end)
end

return M
