-- return require('packer').startup(function(use)
-- Packer can manage itself
-- use { 'wbthomason/packer.nvim' }

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

	{ 'rktjmp/lush.nvim', lazy = true },
	{
		"phha/zenburn.nvim",
		lazy = true,
		-- config = function()
		-- 	require("zenburn").setup()
		-- end
	},
	-- {
	-- 	'navarasu/onedark.nvim',
	-- 	name = 'navarasu_onedark',
	-- 	-- config = function()
	-- 	-- 	require('onedark').load()
	-- 	-- end
	-- },
	{
		'olimorris/onedarkpro.nvim',
		lazy = true,
		-- config = function()
		-- 	vim.cmd [[colorscheme onedark]]
		-- end
	},
	{
		"neanias/everforest-nvim",
		lazy = true,
		-- version = false,
		-- priority = 1000, -- make sure to load this before all the other start plugins
		-- -- Optional; default configuration will be used if setup isn't called.
		-- config = function()
		-- 	require("everforest").setup({
		-- 		-- Your config here
		-- 	})
		-- end,
	},
	{
		'sam4llis/nvim-tundra',
		lazy = true,
		config = function()
			require('nvim-tundra').setup {}
			-- vim.opt.background = 'dark'
			-- vim.cmd [[colorscheme tundra]]
		end
	},
	{
		'rose-pine/neovim',
		lazy = true,
		name = 'rose-pine', --, tag = 'v1.*',
		-- config = function()
		-- 	vim.cmd [[colorscheme rose-pine]]
		-- end
	},
	{
		'marko-cerovac/material.nvim',
		lazy = true,
		-- config = function()
		-- 	-- darker, lighter, oceanic, palenight, deep ocean
		-- 	-- vim.g.material_style = 'palenight'
		-- 	vim.cmd [[colorscheme material]]
		-- end
	},
	{
		'Mofiqul/dracula.nvim',
		lazy = true,
		name = 'dracula',
		-- config = function()
		-- 	vim.cmd [[colorscheme dracula]]
		-- end
	},
	{
		"briones-gabriel/darcula-solid.nvim",
		lazy = true,
		dependencies = "rktjmp/lush.nvim",
		-- config = function()
		-- 	vim.cmd [[colorscheme darcula-solid]]
		-- end
	},
	{
		'catppuccin/nvim',
		lazy = false,
		name = 'catppuccin',
		config = function()
			require("catppuccin").setup {}
			-- latte, frappe, macchiato, mocha
			vim.g.catppuccin_flavour = "macchiato"
			vim.cmd [[colorscheme catppuccin]]
		end
	},
	{
		'sonph/onehalf',
		lazy = true,
		config = function(plugin)
			vim.opt.rtp:append(plugin.dir .. '/vim')
		end
	},
	{
		'folke/tokyonight.nvim',
		lazy = true,
		-- config = function()
		-- 	vim.cmd [[colorscheme tokyonight]]
		-- end
	},
	{
		'rebelot/kanagawa.nvim',
		lazy = true,
		-- config = function()
		-- 	vim.cmd [[colorscheme kanagawa]]
		-- end
	},
	{
		'EdenEast/nightfox.nvim',
		lazy = true,
		-- config = function()
		-- 	vim.cmd [[colorscheme nightfox]]
		-- end
	},
	{
		'projekt0n/github-nvim-theme',
		lazy = true,
		-- config = function()
		-- 	require('github-theme').setup()
		-- end
	},
	{
		'AlexvZyl/nordic.nvim',
		lazy = true,
		-- config = function()
		-- 	require('nordic').load()
		-- end
	},

	{ 
		'kyazdani42/nvim-web-devicons',
		lazy = true
	},
	{
		'hoob3rt/lualine.nvim',
		dependencies = { 'kyazdani42/nvim-web-devicons' },
		event = "BufWinEnter",
		config = function() require("lualine-conf") end
	},

	{ 
		'junegunn/vim-easy-align',
		lazy = true, event = "VeryLazy"
	},
	{ 'nvim-lua/plenary.nvim' },
	{
		"folke/todo-comments.nvim",
		lazy = true,
		dependencies = "nvim-lua/plenary.nvim",
		config = function() require("todo-comments").setup {} end,
		event = 'BufWinEnter'
	},
	{
		'sheerun/vim-polyglot',
		-- event = 'BufReadPre'
	},
	{ 
		'CraneStation/cranelift.vim',
		event = 'BufRead *.clif'
	},
	{
		'JuliaEditorSupport/julia-vim',
		event = 'BufRead *.jl, *.jll'
	},
	{
		'glts/vim-radical',
		lazy = true,
		dependencies = { 'glts/vim-magnum' },
		event = 'VeryLazy'
	},
	{
		'nvim-treesitter/nvim-treesitter',
		build = ":TSUpdate",
		-- event = "BufEnter",
		config = function() require("tree-sitter-conf") end
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		lazy = true,
		dependencies = { 'nvim-treesitter' },
	},
	{
		'akinsho/bufferline.nvim',
		version = "*",
		dependencies = 'kyazdani42/nvim-web-devicons',
		event = "BufWinEnter",
		config = function() require("bufferline-conf") end
	},
	{
		'kyazdani42/nvim-tree.lua',
		lazy = false,
		dependencies = 'kyazdani42/nvim-web-devicons',
		cmd = "NvimTreeToggle",
		config = function() require("nvim-tree-conf") end
	},

	-- {'folke/which-key.nvim', event = "BufWinEnter", config = "require('whichkey-config')"},
	{
		'nvim-telescope/telescope.nvim',
		lazy = true,
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope-fzf-native.nvim',
			'nvim-telescope/telescope-symbols.nvim'
		},
		cmd = "Telescope",
		config = function() require("telescope-conf") end,
		event = 'BufWinEnter'
	},
	{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
	{ 'nvim-telescope/telescope-symbols.nvim' },

	{
		'neovim/nvim-lspconfig',
		lazy = true,
		dependencies = {
			'folke/neoconf.nvim',
			'folke/trouble.nvim',
			'j-hui/fidget.nvim',
			'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'
		},
		config = function() require('lsp') end,
	},
	{ 
		'hrsh7th/nvim-cmp',
		lazy = true,
		event = "InsertEnter",
		dependencies = {
			'neovim/nvim-lspconfig',
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"saadparwaiz1/cmp_luasnip",
			"onsails/lspkind-nvim"
		}
	},
	{ 'hrsh7th/cmp-nvim-lsp', lazy = true },
	{ 'hrsh7th/cmp-nvim-lua', lazy = true },
	{ 'hrsh7th/cmp-buffer', lazy = true },
	{ 'hrsh7th/cmp-path', lazy = true },
	{ 'hrsh7th/cmp-nvim-lsp-signature-help', lazy = true },
	{ 'L3MON4D3/LuaSnip', lazy = true },
	{ 'rafamadriz/friendly-snippets', lazy = true },
	{
		'saadparwaiz1/cmp_luasnip',
		lazy = true,
		dependencies = {
			'L3MON4D3/LuaSnip',
			'rafamadriz/friendly-snippets'
		}
	},
	{
		'j-hui/fidget.nvim',
		lazy = true,
		tag = 'legacy',
		config = function() require("fidget").setup {} end,
	},
	{ 
		'onsails/lspkind-nvim',
		lazy = true
	},
	{
		'folke/trouble.nvim',
		lazy = true,
		dependencies = "kyazdani42/nvim-web-devicons",
		config = function() require("trouble").setup {} end
	},
	{ 'folke/neodev.nvim', lazy = true },
	{ 'folke/neoconf.nvim', lazy = true },
	{
		'folke/zen-mode.nvim',
		lazy = true,
		event = "VeryLazy", -- maybe BufWinEnter for using with -c
		opts = {}
	},
	-- when needed, add mason.nvim for:
	-- LSP: lspconfig & mason-lspconfig.nvim
	-- DAP: nvim-dap
	-- Linters: null-ls.nvim or nvim-lint
	-- Formatters: null-ls.nvim or formatter.nvim
	{
		'norcalli/nvim-colorizer.lua',
		lazy = true,
		config = function() require("colorizer-conf") end,
		event = "BufWinEnter"
	},
	{
		'terrortylor/nvim-comment',
		lazy = true,
		config = function() require("nvim-comment-conf") end,
		event = "VeryLazy"
	},
	-- {
	-- 	'yorickpeterse/nvim-pqf',
	-- 	config = function() require('pqf').setup {} end
	-- },
	{
		'kevinhwang91/nvim-bqf',
		lazy = true,
		ft = 'qf',
		config = function() require("bqf").setup {
				preview = {
					auto_preview = false
				}
			}
		end
	},
	{ 
		'fedepujol/move.nvim',
		lazy = true,
		event = "VeryLazy",
		opts = {}
	},
	{
		'ggandor/leap.nvim',
		lazy = true,
		config = function()
			local leap = require('leap')
			leap.create_default_mappings()
		end,
		event = 'VeryLazy'
	}, -- jumping plugin
	{
		'sindrets/diffview.nvim',
		lazy = true,
		dependencies = 'nvim-lua/plenary.nvim',
		event = 'BufWinEnter'
	},
	{
		'lukas-reineke/indent-blankline.nvim',
		dependencies = {
			'nvim-treesitter',
			-- 'marko-cerovac/material.nvim'
		},
		main = "ibl",
		config = function()
			require("ibl").setup {
				indent = {
					char = "▏"
				},
				exclude = {
					filetypes = { "porth" }
				}
			}
		end,
		opts = {},
	},
	{
		'windwp/nvim-autopairs',
		config = function() require("nvim-autopairs").setup {} end
	},

	{
		'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim',
		lazy = true,
		config = function()
			require("toggle_lsp_diagnostics").init { start_on = false }
		end,
	},

	{ 'gluon-lang/vim-gluon' },
	{ 'shirk/vim-gas' },

}
-- opts
)
-- end)
