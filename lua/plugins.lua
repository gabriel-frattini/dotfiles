return require('packer').startup(function(use)
  use { 'wbthomason/packer.nvim'}  -- Packer manages itself (no version tag, using latest commit)

  -- Colorscheme (requires colorbuddy)
  use { 'svrana/neosolarized.nvim', tag = 'v1.1.0',
    requires = { { 'tjdevries/colorbuddy.nvim', tag = 'v1.0.0' } }
  }

  -- Statusline
  use { 'nvim-lualine/lualine.nvim', tag = 'compat-nvim-0.6' }

  -- Common utilities
  use { 'nvim-lua/plenary.nvim', tag = 'v0.1.4' }

  -- VSCode-like pictograms
  use { 'onsails/lspkind-nvim'}

  -- CMP and snippet plugins
  use { 'hrsh7th/cmp-buffer'}
  use { 'hrsh7th/cmp-nvim-lsp'}
  use { 'hrsh7th/nvim-cmp'}
  use { 'L3MON4D3/LuaSnip', tag = 'v2.1.0' }

  -- LSP configurations and tools
  use { 'neovim/nvim-lspconfig', tag = 'v0.1.7' }
  use { 'jose-elias-alvarez/null-ls.nvim', tag = 'v2.2.0' }
  use { 'williamboman/mason.nvim', tag = 'v1.8.3' }
  use { 'williamboman/mason-lspconfig.nvim', tag = 'v1.26.0' }
  use { 'williamboman/nvim-lsp-installer'}  -- Last version before deprecation (now replaced by Mason)
  use { 'glepnir/lspsaga.nvim'}
  use { 'lukas-reineke/lsp-format.nvim'}

  -- Treesitter
  use {
  'nvim-treesitter/nvim-treesitter',
  commit = '7a2c6211d6f550988fccd8800de8426d5e480a2d',
  run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
}

  -- Rust development tools
  use { 'simrat39/rust-tools.nvim'}

  -- UI enhancements
  use { 'kyazdani42/nvim-web-devicons'}
  use { 'akinsho/nvim-bufferline.lua', tag = 'v3.6.2' }

  -- Telescope and extensions
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.5',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use { 'nvim-telescope/telescope-file-browser.nvim', tag = '*',
    requires = { 'nvim-telescope/telescope.nvim' }
  }

  -- Auto pairs and tags
  use { 'windwp/nvim-autopairs', tag = 'v0.1.6' }
  use { 'windwp/nvim-ts-autotag'}

  -- Other utilities
  use { 'norcalli/nvim-colorizer.lua'}
  use { 'folke/zen-mode.nvim', tag = 'v1.3.0' }
  use { 'iamcco/markdown-preview.nvim', tag = 'v0.0.10', run = 'cd app && npm install' }
  use { 'github/copilot.vim'}
  use { 'lewis6991/gitsigns.nvim', tag = 'v0.7.0' }
  use { 'dinhhuy258/git.nvim'}
  use { 'mbbill/undotree'}
  use { 'leafOfTree/vim-svelte-theme'}
  use { 'nanotee/sqls.nvim'}
  use { 'ThePrimeagen/harpoon'}
  use { 'mfussenegger/nvim-jdtls'}
  use { 'tpope/vim-fugitive', tag = 'v3.7' }
end)

