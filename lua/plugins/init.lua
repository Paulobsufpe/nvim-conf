local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out,                            "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

	{ 'rktjmp/lush.nvim',      lazy = true },
	{
		"phha/zenburn.nvim",
		lazy = true,
		-- opts = {}
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
		lazy = false,
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
		-- config = function()
		-- 	require('nvim-tundra').setup {}
		-- 	vim.opt.background = 'dark'
		-- 	vim.cmd [[colorscheme tundra]]
		-- end
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
		lazy = false,
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
		priority = 1000,
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
		'nvim-tree/nvim-web-devicons',
		lazy = true
	},
	{
		'hoob3rt/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		event = "BufWinEnter",
		config = function() require("plugins/lualine") end
	},

	{
		'junegunn/vim-easy-align',
		lazy = true,
		event = "VeryLazy"
	},
	{ 'nvim-lua/plenary.nvim', lazy = true },
	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = function() require("todo-comments").setup {} end,
		event = 'BufWinEnter'
	},
	{
		'sheerun/vim-polyglot',
		lazy = true,
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
		dependencies = { 'glts/vim-magnum' },
		event = 'VeryLazy'
	},
	{
		'nvim-treesitter/nvim-treesitter',
		lazy = false,
		event = "BufEnter",
		build = ":TSUpdate",
		config = function() require("plugins/tree-sitter") end
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		lazy = true
	},
	{
		'akinsho/bufferline.nvim',
		version = "*",
		dependencies = 'nvim-tree/nvim-web-devicons',
		event = "BufWinEnter",
		config = function() require("plugins/bufferline") end
	},
	{
		'nvim-tree/nvim-tree.lua',
		lazy = true,
		dependencies = 'nvim-tree/nvim-web-devicons',
		cmd = "NvimTreeToggle",
		config = function() require("plugins/nvim-tree") end
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
		config = function() require("plugins/telescope") end,
		event = 'BufWinEnter'
	},
	-- { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', lazy = true },
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		url = "/home/paulobs/Develop/telescope-fzf-native.nvim",
		build = 'make',
		lazy = true
	},
	{ 'nvim-telescope/telescope-symbols.nvim', lazy = true },

	{
		'neovim/nvim-lspconfig',
		lazy = true,
		dependencies = {
			'folke/neoconf.nvim',
			'folke/trouble.nvim',
			'j-hui/fidget.nvim',
			'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'
		},
		config = function() require('plugins/lsp') end,
	},
	{
		'hrsh7th/nvim-cmp',
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
	{ 'hrsh7th/cmp-nvim-lsp',                  lazy = true },
	{ 'hrsh7th/cmp-nvim-lua',                  lazy = true },
	{ 'hrsh7th/cmp-buffer',                    lazy = true },
	{ 'hrsh7th/cmp-path',                      lazy = true },
	{ 'hrsh7th/cmp-nvim-lsp-signature-help',   lazy = true },
	{ 'L3MON4D3/LuaSnip',                      lazy = true },
	{ 'rafamadriz/friendly-snippets',          lazy = true },
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
		tag = 'v1.5.0',
		config = function() require("fidget").setup {} end,
	},
	{
		'onsails/lspkind-nvim',
		lazy = true
	},
	{
		'folke/trouble.nvim',
		lazy = true,
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function() require("trouble").setup {} end
	},
	{
		'folke/lazydev.nvim',
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
			-- disable when a .luarc.json file is found
			enabled = function(root_dir)
				return not vim.uv.fs_stat(root_dir .. "/.luarc.json")
			end,
		},
		lazy = true
	},
	{ 'folke/neoconf.nvim', lazy = true },
	{
		'folke/zen-mode.nvim',
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
		config = function() require("plugins/colorizer") end,
		event = "BufWinEnter"
	},
	{
		'terrortylor/nvim-comment',
		config = function() require("plugins/nvim-comment") end,
		event = "VeryLazy"
	},
	-- {
	-- 	'yorickpeterse/nvim-pqf',
	-- 	config = function() require('pqf').setup {} end
	-- },
	{
		'kevinhwang91/nvim-bqf',
		ft = 'qf',
		opts = {
			preview = {
				auto_preview = false
			}
		}
	},
	{
		'fedepujol/move.nvim',
		event = "VeryLazy",
		opts = {}
	},
	{
		'ggandor/leap.nvim',
		config = function()
			local leap = require('leap')
			leap.create_default_mappings()
		end,
		event = 'VeryLazy'
	}, -- jumping plugin
	{
		'sindrets/diffview.nvim',
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
		event = "BufEnter",
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

	{ 'shirk/vim-gas' },

}, { rocks = { enable = false } }
)
