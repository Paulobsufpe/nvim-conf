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

	{ 'rktjmp/lush.nvim' },
	{
		"phha/zenburn.nvim",
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
		-- config = function()
		-- 	vim.cmd [[colorscheme onedark]]
		-- end
	},
	{
		"neanias/everforest-nvim",
		-- version = false,
		-- lazy = false,
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
		config = function()
			require('nvim-tundra').setup {}
			-- vim.opt.background = 'dark'
			-- vim.cmd [[colorscheme tundra]]
		end
	},
	{
		'rose-pine/neovim',
		name = 'rose-pine', --, tag = 'v1.*',
		-- config = function()
		-- 	vim.cmd [[colorscheme rose-pine]]
		-- end
	},
	{
		'marko-cerovac/material.nvim',
		lazy = false,
		config = function()
			-- darker, lighter, oceanic, palenight, deep ocean
			-- vim.g.material_style = 'palenight'
			vim.cmd [[colorscheme material]]
		end
	},
	{
		'Mofiqul/dracula.nvim',
		name = 'dracula',
		-- config = function()
		-- 	vim.cmd [[colorscheme dracula]]
		-- end
	},
	{
		"briones-gabriel/darcula-solid.nvim",
		dependencies = "rktjmp/lush.nvim",
		-- config = function()
		-- 	vim.cmd [[colorscheme darcula-solid]]
		-- end
	},
	{
		'catppuccin/nvim',
		name = 'catppuccin',
		-- config = function()
		-- 	require("catppuccin").setup {},
		-- -- latte, frappe, macchiato, mocha
		-- 	vim.g.catppuccin_flavour = "macchiato"
		-- 	vim.cmd [[colorscheme catppuccin]]
		-- end
	},
	{
		'sonph/onehalf',
		config = function(plugin)
			vim.opt.rtp:append(plugin.dir .. '/vim')
		end
	},
	{
		'folke/tokyonight.nvim',
		-- config = function()
		-- 	vim.cmd [[colorscheme tokyonight]]
		-- end
	},
	{
		'rebelot/kanagawa.nvim'
		-- config = function()
		-- 	vim.cmd [[colorscheme kanagawa]]
		-- end
	},
	{
		'EdenEast/nightfox.nvim'
		-- config = function()
		-- 	vim.cmd [[colorscheme nightfox]]
		-- end
	},
	{
		'projekt0n/github-nvim-theme'
		-- config = function()
		-- 	require('github-theme').setup()
		-- end
	},
	{
		'AlexvZyl/nordic.nvim',
		-- config = function()
		-- 	require('nordic').load()
		-- end
	},

	'kyazdani42/nvim-web-devicons',
	{
		'hoob3rt/lualine.nvim',
		dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true },
		-- event = "BufWinEnter",
		config = function() require("lualine-conf") end
	},

	{ 'junegunn/vim-easy-align' },
	{ 'nvim-lua/plenary.nvim' },
	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = function() require("todo-comments").setup {} end,
		-- event = 'BufRead'
	},
	{
		'sheerun/vim-polyglot',
		-- lazy = false
		-- event = 'BufReadPre'
	},
	{ 'CraneStation/cranelift.vim' },
	{
		'JuliaEditorSupport/julia-vim',
		-- event = 'BufReadPre'
	},
	{
		'glts/vim-radical',
		dependencies = { 'glts/vim-magnum' },
		-- event = 'VimEnter'
	},
	{
		'nvim-treesitter/nvim-treesitter',
		build = ":TSUpdate",
		-- event = "BufEnter",
		config = function() require("tree-sitter-conf") end
	},
	-- FIX: por algum motivo bufferline n está func. no neovim nightly
	-- {
	-- 	'akinsho/bufferline.nvim',
	-- 	version = "v2.*",
	-- 	dependencies = 'kyazdani42/nvim-web-devicons',
	-- 	event = "BufWinEnter",
	-- 	config = function() require("bufferline-conf") end
	-- },
	{
		'kyazdani42/nvim-tree.lua',
		dependencies = 'kyazdani42/nvim-web-devicons',
		cmd = "NvimTreeToggle",
		config = function() require("nvim-tree").setup {} end
	},

	-- {'folke/which-key.nvim', event = "BufWinEnter", config = "require('whichkey-config')"},
	{
		'nvim-telescope/telescope.nvim',
		lazy = false,
		dependencies = { 'nvim-lua/plenary.nvim' },
		cmd = "Telescope",
		config = function() require("telescope-conf") end,
		-- event = 'BufWinEnter'
	},
	{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
	{ 'nvim-telescope/telescope-symbols.nvim' },

	{
		'neovim/nvim-lspconfig',
		config = function() require('lsp') end,
		-- event = 'BufReadPost'
	},
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'hrsh7th/cmp-buffer' },
	{ 'hrsh7th/nvim-cmp' },
	{ 'hrsh7th/cmp-path' },
	{ 'hrsh7th/cmp-nvim-lua' },
	{ 'hrsh7th/cmp-nvim-lsp-signature-help' },
	{ 'L3MON4D3/LuaSnip' },
	{
		'saadparwaiz1/cmp_luasnip',
		dependencies = {
			'L3MON4D3/LuaSnip',
			'rafamadriz/friendly-snippets'
		}
	},
	{ 'rafamadriz/friendly-snippets' },
	{
		'j-hui/fidget.nvim',
		dependencies = 'neovim/nvim-lspconfig',
		tag = 'legacy',
		config = function() require("fidget").setup {} end,
		-- after = 'nvim-lspconfig'
	},
	{ 'onsails/lspkind-nvim' },
	{
		'folke/trouble.nvim',
		dependencies = "kyazdani42/nvim-web-devicons",
		config = function() require("trouble").setup {} end
	},
	{ 'folke/neodev.nvim' },
	{ 'folke/neoconf.nvim' },
	-- when needed, add mason.nvim for:
	-- LSP: lspconfig & mason-lspconfig.nvim
	-- DAP: nvim-dap
	-- Linters: null-ls.nvim or nvim-lint
	-- Formatters: null-ls.nvim or formatter.nvim
	{
		'norcalli/nvim-colorizer.lua',
		config = function() require("colorizer-conf") end,
		-- event = "BufRead"
	},
	{
		'terrortylor/nvim-comment',
		config = function() require("nvim_comment-conf") end,
		-- event = "BufReadPost"
	},
	{
		'yorickpeterse/nvim-pqf',
		config = function() require('pqf').setup {} end
	},
	{
		'sindrets/diffview.nvim',
		dependencies = 'nvim-lua/plenary.nvim',
		-- event = 'VimEnter'
	},
	{
		'lukas-reineke/indent-blankline.nvim',
		dependencies = {
			'nvim-treesitter',
			-- 'marko-cerovac/material.nvim'
		},
		main = "ibl",
		opts = {},
	},
	{
		'windwp/nvim-autopairs',
		config = function() require("nvim-autopairs").setup {} end
	},

	{
		'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim',
		config = function()
			require("toggle_lsp_diagnostics").init { start_on = false }
		end,
		-- after = 'nvim-lspconfig'
	},

	{ 'gluon-lang/vim-gluon' },
	{
		'fsharp/vim-fsharp',
		ft = 'fsharp',
		build = 'make fsautocomplete'
	},
	{ 'shirk/vim-gas' },

}
-- opts
)
-- end)
