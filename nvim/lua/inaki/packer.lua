-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use({
	  'rose-pine/neovim',
	  as = 'rose-pine',
	  --config = function()
	  --    require("rose-pine").setup()
	  --    vim.cmd('colorscheme rose-pine')
	  --end
  })

  -- Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')

  use('mbbill/undotree')
  use('tpope/vim-fugitive')

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},             -- Required
		  {'williamboman/mason.nvim'},           -- Optional
		  {'williamboman/mason-lspconfig.nvim'}, -- Optional

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},         -- Required
		  {'hrsh7th/cmp-nvim-lsp'},     -- Required
		  {'hrsh7th/cmp-buffer'},       -- Optional
		  {'hrsh7th/cmp-path'},         -- Optional
		  {'saadparwaiz1/cmp_luasnip'}, -- Optional
		  {'hrsh7th/cmp-nvim-lua'},     -- Optional

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},             -- Required
		  {'rafamadriz/friendly-snippets'}, -- Optional
	  }
  }

  use('nvim-lualine/lualine.nvim')

  use('christoomey/vim-tmux-navigator')

  -- Clipboard
  use('tmux-plugins/vim-tmux-focus-events')
  use('roxma/vim-tmux-clipboard')

  -- Split resize
  use('talek/obvious-resize')
  
  -- Easymotion
  use('easymotion/vim-easymotion')

  use {
    'lewis6991/gitsigns.nvim',
    -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
  }

  -- Fade inactive window
--  use('TaDaa/vimade') --pip3 install pynvim
--  use 'sunjon/shade.nvim'

  -- Match if-endif
  use 'andymass/vim-matchup'

-- Remember last buffer position
  use({ 'vladdoster/remember.nvim', config = [[ require('remember') ]] })

-- Diffview
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

-- Suda
  use { 'lambdalisue/suda.vim' }

  use 'nvim-tree/nvim-web-devicons'

-- Copilot
--  use {'github/copilot.vim'}
--  use {
--    "zbirenbaum/copilot.lua",
--    cmd = "Copilot",
--    event = "InsertEnter",
--    config = function()
--      require("copilot").setup({
--	  })
--    end,
--}

-- Copilot-cmp 
--  use {
--    "zbirenbaum/copilot-cmp",
--    after = { "copilot.lua" },
--    config = function ()
--      require("copilot_cmp").setup()
--    end
--  }
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
	require("toggleterm").setup()
  end}

  -- Tabnine IA code completion
  use { 'codota/tabnine-nvim', run = "./dl_binaries.sh" }

  -- Easy comment and uncomment
  use "terrortylor/nvim-comment"

  -- Colors on csv
  use 'mechatroner/rainbow_csv'

end)
