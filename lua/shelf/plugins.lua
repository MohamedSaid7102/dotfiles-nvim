local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  -- Theme | You can pick any one you want
  use {
      'svrana/neosolarized.nvim',
      requires = { 'tjdevries/colorbuddy.nvim' }
  }

  use 'nvim-lualine/lualine.nvim' -- Statusline
  use 'nvim-lua/plenary.nvim' -- Common utilities
  use 'onsails/lspkind-nvim' -- vscode-like pictograms
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp' -- Completion
  use 'neovim/nvim-lspconfig' -- LSP
  --use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  --use 'MunifTanjim/prettier.nvim' --Prettier plugin for Neovim's built-in

  use({
      "L3MON4D3/LuaSnip",
      -- install jsregexp (optional!:).
      run = "make install_jsregexp"
  })

  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
      --run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'

  use 'kyazdani42/nvim-web-devicons' -- File icons

  use 'akinsho/nvim-bufferline.lua'

  use 'norcalli/nvim-colorizer.lua' -- For colors hash color overlay

  use 'glepnir/lspsaga.nvim' -- LSP UIs

  use 'dinhhuy258/git.nvim' -- For git blam & browse
  use 'lewis6991/gitsigns.nvim'

  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'


  -- ThePrimeagen File navigator (Harpoon): https://github.com/ThePrimeagen/harpoon
  use('theprimeagen/harpoon')

  -- UndoTree to track changes and comeback to some of them: https://github.com/mbbill/undotree
  use('mbbill/undotree')

  -- Fugitive to manipulate git: https://github.com/tpope/vim-fugitive
  use('tpope/vim-fugitive')

  -- https://github.com/terrortylor/nvim-comment
  use "terrortylor/nvim-comment"
end)
