local M = {}

function M.enable ()
  vim.g.gruvbox_contrast_dark = 'hard'
  vim.g.gruvbox_contrast_light = 'hard'
  vim.opt.background = 'dark'
  vim.cmd [[ colorscheme gruvbox ]]
end

return M
