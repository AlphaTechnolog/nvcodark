vim.cmd [[ set guifont=JetBrainsMono\ Nerd\ Font:h15 ]]

local core = require('core')
local ok, err = pcall(core.start)

if not ok then
  error('Cannot start neovim configuration: ' .. err)
end
