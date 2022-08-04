local M = {}
local vim_tools = require("nvcodark.utils.vim")

function M.bootstrap ()
   local api, fn = vim_tools.get_all({'api', 'fn'})
   local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
   local packer_url = 'https://github.com/wbthomason/packer.nvim'

   if fn.empty(fn.glob(install_path)) > 0 then
      print('Automatically downloading packer!...')
      fn.system({ 'git', 'clone', '--depth', '1', packer_url, install_path })
      vim.cmd [[ qa! ]]
   end
end

M.options = {
   auto_clean = true,
   compile_on_sync = true,
   git = { clone_timeout = 6000 },
   display = {
      working_sym = "ﲊ",
      error_sym = "✗ ",
      done_sym = " ",
      removed_sym = " ",
      moved_sym = "",
      open_fn = function()
         return require("packer.util").float { border = "single" }
      end,
   }
}

function M.load (plugs)
   local ok, packer = pcall(require, 'packer')

   if not ok then
      return
   end

   vim.cmd [[ packadd packer.nvim ]]

   packer.init(M.options)

   packer.startup(function (use)
      use 'wbthomason/packer.nvim'
      for _, plug in ipairs(plugs) do
         use(plug)
      end
   end)
end

return M
