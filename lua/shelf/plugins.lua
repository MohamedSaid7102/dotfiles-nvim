local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  -- Theme | You can pick any one you want
  -- To re-enable this theme, uncomment following & go to neosolarized.rc.lua file in after/ and uncomment it
  --
  use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }
  --
  -- Option 2
  -- https://github.com/catppuccin/nvim
  --
  -- To re-enable this theme, uncomment following & go to catppuccin.rc.lua file in after/ and uncomment it
  -- use { "catppuccin/nvim", as = "catppuccin" }

  use 'nvim-lualine/lualine.nvim' -- Statusline
  use 'nvim-lua/plenary.nvim'     -- Common utilities
  use 'onsails/lspkind-nvim'      -- vscode-like pictograms
  use 'hrsh7th/cmp-buffer'        -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp'      -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp'          -- Completion
  use 'neovim/nvim-lspconfig'     -- LSP

  --use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  --use 'MunifTanjim/prettier.nvim' --Prettier plugin for Neovim's built-in

  use {
    "prettier/vim-prettier",
    run = "npm install",
    ft = { "javascript", "typescript", "json", "css", "scss", "less", "graphql", "markdown", "vue", "html", "yaml",
      "svelte", "mdx", "jsx", "tsx" },
    cmd = { "Prettier", "PrettierAsync" },
  }

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

  use 'glepnir/lspsaga.nvim'        -- LSP UIs

  -- use 'dinhhuy258/git.nvim'         -- For git blam & browse
  use 'lewis6991/gitsigns.nvim'

  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  -- ThePrimeagen File navigator (Harpoon): https://github.com/ThePrimeagen/harpoon
  use('theprimeagen/harpoon')

  -- UndoTree to track changes and comeback to some of them: https://github.com/mbbill/undotree
  use('mbbill/undotree')

  -- Fugitive to manipulate git: https://github.com/tpope/vim-fugitive
  use('tpope/vim-fugitive')

  -- Comment code: https://github.com/terrortylor/nvim-comment
  use "terrortylor/nvim-comment"

  -- Auto save: https://github.com/Pocco81/auto-save.nvim
  -- Enable & Disable => :ASToggle<CR>
  use({
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup {
        trigger_events = { "InsertLeave" --[[ "TextChanged"]] },
        enabled = true,
        write_all_buffers = true,
        debounce_delay = 500,
      }
    end,
  })

  -- Copilot: https://github.com/github/copilot.vim.git


  use {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  -- Emmet: https://github.com/mattn/emmet-vim
  use 'mattn/emmet-vim'

  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'

  -- https://www.youtube.com/shorts/bf5cS9M5m3c
  use 'saadparwaiz1/cmp_luasnip'     -- nvim-cmp source for luasnip snippets
  use 'rafamadriz/friendly-snippets' -- Snippets'

  -- quacker like!, codei.vim: https://github.com/metakirby5/codi.vim
  use 'metakirby5/codi.vim'

  -- Dap: https://github.com/mfussenegger/nvim-dap
  use { "mfussenegger/nvim-dap" }

  -- Debugging UI: https://github.com/rcarriga/nvim-dap-ui
  use { "rcarriga/nvim-dap-ui" }

  -- Integration with telescope: https://github.com/nvim-telescope/telescope-dap.nvim
  use { 'nvim-telescope/telescope-dap.nvim' }

  -- makes it possible to have a lua file in base project to config how debugging will work..
  use 'ldelossa/nvim-dap-projects'

  -- Virtual text for DAP: https://github.com/theHamsta/nvim-dap-virtual-text
  use { 'theHamsta/nvim-dap-virtual-text' }

  -- git diff: https://github.com/sindrets/diffview.nvim
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

  -- color picker: https://github.com/KabbAmine/vCoolor.vim
  -- use 'KabbAmine/vCoolor.vim'

  -- Vim surround
  use 'tpope/vim-surround'

  -- close tag auto rename: https://github.com/AndrewRadev/tagalong.vim
  use 'AndrewRadev/tagalong.vim'

  -- Match open and close tag:
  use 'andymass/vim-matchup'
  use 'gregsexton/MatchTag'
  -- Auto close tag
  use 'alvan/vim-closetag'

  -- react & ract native snippets: https://github.com/ults-io/vscode-react-javascript-snippets
  use { 'dsznajder/vscode-es7-javascript-react-snippets',
    run = 'yarn install --frozen-lockfile && yarn compile'
  }

  -- Smooth scrolling
  use 'karb94/neoscroll.nvim'

  -- Color pairs: https://github.com/luochen1990/rainbow
  use 'luochen1990/rainbow'

  -- Dart & Flutter setup start
  -- https://x-team.com/blog/neovim-flutter/
  use 'dart-lang/dart-vim-plugin'
  use 'thosakwe/vim-flutter'
  use {
    'akinsho/flutter-tools.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
  }
  use 'natebosch/vim-lsc'
  use 'natebosch/vim-lsc-dart'
  -- use 'natebosch/dartlang-snippets'

  -- Telescope simulators: https://github.com/dimaportenko/telescope-simulators.nvim
  use "dimaportenko/telescope-simulators.nvim"

  -- Github branches view: https://github.com/rbong/vim-flog
  use 'rbong/vim-flog'

  -- Floaterm: https://github.com/voldikss/vim-floaterm
  -- Inegrate any terminal program into neovim
  use 'voldikss/vim-floaterm'


  -- Bootstrap completion
  use 'Jezda1337/cmp_bootstrap'

  use {
    "Jezda1337/nvim-html-css",
    requires = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-lua/plenary.nvim",
    },
  }

  -- -- ChatGPT
  -- use({
  --   'terror/chatgpt.nvim',
  --   run = 'pip3 install -r requirements.txt'
  -- })

  -- Dart & Flutter setup end

  -- Auto close tag
  -- use 'alvan/vim-closetag'
  -- Look at this in the future when you need becomer more productive!!
  --
  -- https://alpha2phi.medium.com/neovim-dap-enhanced-ebc730ff498b
  --
  -- Neotest: https://github.com/nvim-neotest/neotest
  -- use {
  --   "nvim-neotest/neotest",
  --   requires = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --     "antoinemadec/FixCursorHold.nvim"
  --   }
  -- }
end)
