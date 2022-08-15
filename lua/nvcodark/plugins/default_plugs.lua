return {
  { "lewis6991/impatient.nvim" },
  { "neoclide/vim-jsx-improve" },

  -- lsp management
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "saadparwaiz1/cmp_luasnip" },
  { "L3MON4D3/LuaSnip" },
  { "glepnir/lspsaga.nvim", branch = "main" },
  { "onsails/lspkind.nvim" },
  { "ray-x/lsp_signature.nvim" },

  {
    "kyazdani42/nvim-web-devicons",
    config = function()
      require("nvcodark.plugins.configs.icons").setup()
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("nvcodark.plugins.configs.lualine").setup()
    end,
  },

  {
    "norcalli/nvim-colorizer.lua",
    cmd = {
      "ColorizerAttachToBuffer",
      "ColorizerDetachFromBuffer",
      "ColorizerReloadAllBuffers",
      "ColorizerToggle",
    },
    config = function()
      require("nvcodark.plugins.configs.colorizer").setup()
    end,
    setup = function()
      require("nvcodark.core.lazy_load").colorizer()
    end,
    opt = true,
  },

  {
    "akinsho/bufferline.nvim",
    opt = true,
    setup = function()
      require("nvcodark.core.lazy_load").bufferline()
    end,
    config = function()
      require("nvcodark.plugins.configs.bufferline").setup()
    end,
  },

  {
    "famiu/bufdelete.nvim",
    after = "bufferline.nvim",
  },

  {
    "nvim-lua/plenary.nvim",
    module = "plenary",
  },

  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
  },

  {
    "nvim-treesitter/nvim-treesitter",
    module = "nvim-treesitter",
    setup = function()
      require("nvcodark.core.lazy_load").on_file_open "nvim-treesitter"
    end,
    cmd = {
      "TSInstall",
      "TSBufEnable",
      "TSBufDisable",
      "TSEnable",
      "TSDisable",
      "TSModuleInfo",
    },
    run = ":TSUpdate",
    config = function()
      require("nvcodark.plugins.configs.treesitter").setup()
    end,
  },

  {
    "windwp/nvim-autopairs",
    opt = true,
    setup = function()
      require("nvcodark.core.lazy_load").on_file_open "nvim-autopairs"
    end,
    config = function()
      require("nvcodark.plugins.configs.autopairs").setup()
    end,
  },

  {
    "kyazdani42/nvim-tree.lua",
    config = function()
      require("nvcodark.plugins.configs.ntree").setup()
    end,
    cmd = {
      "NvimTreeToggle",
      "NvimTreeOpen",
      "NvimTreeFocus",
      "NvimTreeClose",
      "NvimTreeFindFile",
      "NvimTreeFindFileToggle",
    },
  },

  {
    "akinsho/toggleterm.nvim",
    cmd = "ToggleTerm",
    config = function()
      require("nvcodark.plugins.configs.toggleterm").setup()
    end,
  },
}
