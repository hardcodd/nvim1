return function(use)

  -- Plenary (needed for many plugins)
  use 'nvim-lua/plenary.nvim'

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Icons
  use 'kyazdani42/nvim-web-devicons'

  -- Theme
  use 'projekt0n/github-nvim-theme'

  -- Lualine
  use 'nvim-lualine/lualine.nvim'

  -- Which key
  use 'folke/which-key.nvim'

  -- Telescope
  use 'nvim-telescope/telescope.nvim'

  -- Treesitter
  use 'nvim-treesitter/nvim-treesitter'

  -- Markdown preview
  use {
    'iamcco/markdown-preview.nvim',
    run = function() vim.fn['mkdp#util#install']() end,
  }

  -- Indent blankline
  use 'lukas-reineke/indent-blankline.nvim'

  -- Comment
  use 'numToStr/Comment.nvim'

  -- Lsp
  use {
    'williamboman/nvim-lsp-installer',
    'neovim/nvim-lspconfig'
  }

  -- Cmp
  use {
    'rafamadriz/friendly-snippets',
    'hrsh7th/nvim-cmp',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
  }

end
