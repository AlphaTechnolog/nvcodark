local config = require('config')

vim.cmd [[packadd packer.nvim]]

require('packer').init({
  git = {
    -- to prevent problems with slow internet connections
    clone_timeout = 10000000
  }
})

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'CantoroMC/ayu-nvim'
  use {'folke/tokyonight.nvim', as = 'tokyonight'}
  use 'kyazdani42/nvim-tree.lua'
  use 'kyazdani42/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'
  use 'akinsho/bufferline.nvim'
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
  use { "mangeshrex/everblush.vim" }
  use 'frenzyexists/aquarium-vim'
  use {'NightCS/night.nvim', as = 'night'}

  -- additional plugins
  for _, plug in ipairs(config.plugins.additional_plugins) do
    use(plug)
  end
end)
