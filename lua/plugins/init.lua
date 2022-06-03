return require('packer').startup(function(use)
	-- Packer can manage itself
	use {'wbthomason/packer.nvim'}
	use {'rose-pine/neovim'}
	use {'marko-cerovac/material.nvim'}
	use {'dracula/vim', as = 'dracula'}
	use {
		'catppuccin/nvim', as = 'catppuccin',
		config = function()
			require("catppuccin").setup {}
			vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
			vim.cmd[[colorscheme catppuccin]]
		end
	}

	use {'junegunn/vim-easy-align'}
	use {'nvim-lua/plenary.nvim'}
	use {
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function() require("todo-comments").setup {} end,
		event = 'BufRead'
	}
	use {'sheerun/vim-polyglot', event = 'BufRead'}
	use {'JuliaEditorSupport/julia-vim', event = 'BufReadPre'}
	use {
		'glts/vim-radical', 
		requires = {'glts/vim-magnum'}, 
		event = 'VimEnter'
	}
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ":TSUpdate",
		event = "BufEnter",
		config = "require('tree-sitter-conf')"
	}
	use 'kyazdani42/nvim-web-devicons'
	use {
		'hoob3rt/lualine.nvim',
		requires = {'kyazdani42/nvim-web-devicons', opt = true},
		event = "BufWinEnter",
		config = "require('lualine-conf')"
	}
	use {
		'akinsho/bufferline.nvim',
		requires = 'kyazdani42/nvim-web-devicons',
		event = "BufWinEnter",
		config = "require('bufferline-conf')"
	}
	use {
		'kyazdani42/nvim-tree.lua',
		requires = 'kyazdani42/nvim-web-devicons',
		cmd = "NvimTreeToggle",
		config = "require('nvim-tree-conf')"
	}
	
	-- use {'folke/which-key.nvim', event = "BufWinEnter", config = "require('whichkey-config')"}
	use {
		'nvim-telescope/telescope.nvim',
		requires = {'nvim-lua/plenary.nvim'},
		cmd = "Telescope",
		config = "require('telescope-conf')",
		event = 'BufWinEnter'
	}
	use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	use {'nvim-telescope/telescope-symbols.nvim'}

	use {
		'neovim/nvim-lspconfig', 
		config = "require('lsp')", 
		event = 'BufReadPost'
	}
	use {'hrsh7th/cmp-nvim-lsp'}
	use {'hrsh7th/cmp-buffer'}
	use {'hrsh7th/nvim-cmp'}
	use {'hrsh7th/cmp-path'}
	use {'L3MON4D3/LuaSnip'}
	use {'saadparwaiz1/cmp_luasnip' }
	use {'rafamadriz/friendly-snippets'}
	use {
		'j-hui/fidget.nvim',
		requires = 'neovim/nvim-lspconfig',
		config = function() require("fidget").setup {} end,
		after = 'nvim-lspconfig'
	}
	use {'onsails/lspkind-nvim'}
	use {
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function() require("trouble").setup {} end
	}
	use {'williamboman/nvim-lsp-installer'}
	use {
		'norcalli/nvim-colorizer.lua', 
		config = "require('colorizer-conf')", 
		event = "BufRead"
	}
	use {
		'terrortylor/nvim-comment',
		config = "require('nvim_comment-conf')",
		event = "BufReadPost"
	}
	use {
		'sindrets/diffview.nvim',
		requires = 'nvim-lua/plenary.nvim',
		event = 'VimEnter'
	}

	use {
		'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim', 
		config = function() 
		  require("toggle_lsp_diagnostics").init { start_on = false } 
		end,
		after = 'nvim-lspconfig'
	}

end)
