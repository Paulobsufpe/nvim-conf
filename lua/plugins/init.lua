return require('packer').startup(function(use)
	-- Packer can manage itself
	use { 'wbthomason/packer.nvim' }

	use { 'rktjmp/lush.nvim' }
	use {
		'rose-pine/neovim', as = 'rose-pine', tag = 'v1.*',
		-- config = function()
		-- 	vim.cmd [[colorscheme rose-pine]]
		-- end
	}
	use { 
		'marko-cerovac/material.nvim',
		-- config = function()
		-- 	-- darker, lighter, oceanic, palenight, deep ocean
		-- 	-- vim.g.material_style = 'palenight'
		-- 	vim.cmd [[colorscheme material]]
		-- end
	}
	use { 
		'Mofiqul/dracula.nvim', as = 'dracula',
		-- config = function()
		-- 	vim.cmd [[colorscheme dracula]]
		-- end
	}
	use {
		"briones-gabriel/darcula-solid.nvim",
		requires = "rktjmp/lush.nvim",
		config = function()
			vim.cmd [[colorscheme darcula-solid]]
		end
	}
	use {
		'catppuccin/nvim', as = 'catppuccin',
		-- config = function()
		-- 	require("catppuccin").setup {}
		-- -- latte, frappe, macchiato, mocha
		-- 	vim.g.catppuccin_flavour = "macchiato" 
		-- 	vim.cmd [[colorscheme catppuccin]]
		-- end
	}
	use 'kyazdani42/nvim-web-devicons'
	use {
		'hoob3rt/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
		event = "BufWinEnter",
		config = function() require("lualine-conf") end
	}

	use { 'junegunn/vim-easy-align' }
	use { 'nvim-lua/plenary.nvim' }
	use {
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function() require("todo-comments").setup {} end,
		event = 'BufRead'
	}
	use { 'sheerun/vim-polyglot', event = 'BufRead' }
	use { 'JuliaEditorSupport/julia-vim', event = 'BufReadPre' }
	use {
		'glts/vim-radical',
		requires = { 'glts/vim-magnum' },
		event = 'VimEnter'
	}
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ":TSUpdate",
		event = "BufEnter",
		config = function() require("tree-sitter-conf") end
	}
	use {
		'akinsho/bufferline.nvim', tag = "v2.*",
		requires = 'kyazdani42/nvim-web-devicons',
		event = "BufWinEnter",
		config = function() require("bufferline-conf") end
	}
	use {
		'kyazdani42/nvim-tree.lua',
		requires = 'kyazdani42/nvim-web-devicons',
		cmd = "NvimTreeToggle",
		config = function() require("nvim-tree").setup {} end
	}

	-- use {'folke/which-key.nvim', event = "BufWinEnter", config = "require('whichkey-config')"}
	use {
		'nvim-telescope/telescope.nvim',
		requires = { 'nvim-lua/plenary.nvim' },
		cmd = "Telescope",
		config = function() require("telescope-conf") end,
		event = 'BufWinEnter'
	}
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	use { 'nvim-telescope/telescope-symbols.nvim' }

	use {
		'neovim/nvim-lspconfig',
		config = function() require('lsp') end,
		event = 'BufReadPost'
	}
	use { 'hrsh7th/cmp-nvim-lsp' }
	use { 'hrsh7th/cmp-buffer' }
	use { 'hrsh7th/nvim-cmp' }
	use { 'hrsh7th/cmp-path' }
	use { 'L3MON4D3/LuaSnip' }
	use { 'saadparwaiz1/cmp_luasnip' }
	use { 'rafamadriz/friendly-snippets' }
	use {
		'j-hui/fidget.nvim',
		requires = 'neovim/nvim-lspconfig',
		config = function() require("fidget").setup {} end,
		after = 'nvim-lspconfig'
	}
	use { 'onsails/lspkind-nvim' }
	use {
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function() require("trouble").setup {} end
	}
	use { 'williamboman/nvim-lsp-installer' }
	use {
		'norcalli/nvim-colorizer.lua',
		config = function() require("colorizer-conf") end,
		event = "BufRead"
	}
	use {
		'terrortylor/nvim-comment',
		config = function() require("nvim_comment-conf") end,
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

	use { 'gluon-lang/vim-gluon' }
	use {
		'fsharp/vim-fsharp',
		ft = 'fsharp',
		run = 'make fsautocomplete'
	}
	use { 'shirk/vim-gas' }

end)
