local config = require('config')

local present, packer = pcall(require, 'packer')

local function clone_packer ()
  local packer_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

  print("Cloning packer...")
  vim.fn.delete(packer_path, 'rf') -- remove the dir first to prevent problems
  vim.fn.system({
    'git', 'clone', 'https://github.com/wbthomason/packer.nvim',
    '--depth', '20', packer_path
  })

  vim.cmd "packadd packer.nvim"
  present, packer = pcall(require, 'packer')

  if present then
    print('Packer has been cloned successfully!')
  else
    print("Couldn't clone packer :c -> " .. packer) -- showing error
  end
end

if not present then
  clone_packer()
else
  vim.cmd [[ packadd packer.nvim ]]
end

packer.init({
  compile_on_sync = true,
  snapshot = nil,
  display = {
    open_fn = function ()
      return require('packer.util').float {
        border = 'single',
      }
    end
  },
  git = {
    -- to prevent problems with slow internet connections
    clone_timeout = 10000000
  }
})

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'lewis6991/impatient.nvim'
  use {
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons'}
  }
  use 'karb94/neoscroll.nvim'
  use 'CantoroMC/ayu-nvim'
  use {'folke/tokyonight.nvim', as = 'tokyonight'}
  use 'kyazdani42/nvim-tree.lua'
  use 'kyazdani42/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/plenary.nvim' },
    },
  }
  use 'nvim-treesitter/nvim-treesitter'
  use {'norcalli/nvim-colorizer.lua', as = 'colorizer'}
  use 'windwp/nvim-autopairs'
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'L3MON4D3/LuaSnip'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'onsails/lspkind-nvim'
  use 'ray-x/lsp_signature.nvim'
  use 'folke/lsp-colors.nvim'
  use 'morhetz/gruvbox'
  use 'AlphaTechnolog/pywal.nvim'
  use 'AlphaTechnolog/onedarker.nvim'
  use {'catppuccin/nvim', as = 'catppuccin'}
  use({
    'CosmicNvim/cosmic-ui',
    requires = { 'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim' },
  })
  use 'rcarriga/nvim-notify'
  use 'marko-cerovac/material.nvim'
  use 'monsonjeremy/onedark.nvim'
  use 'yashguptaz/calvera-dark.nvim'
  use 'sainnhe/everforest'
  use {"akinsho/toggleterm.nvim"}
  use 'frenzyexists/aquarium-vim'
  use {'NightCS/night.nvim', as = 'night'}
  use {'rose-pine/neovim', as = 'rosepine'}
  use 'Everblush/everblush.nvim'
  use 'levuaska/levuaska.nvim'
  use 'cocopon/iceberg.vim'
  use 'Mofiqul/dracula.nvim'
  use 'shaunsingh/nord.nvim'
  use {'decaycs/decay.nvim', as = 'decay'} -- by me, my new beautiful theme :3

  -- additional plugins
  for _, plug in ipairs(config.plugins.additional_plugins) do
    use(plug)
  end
end)
