require'nvim-treesitter.configs'.setup {
	ensure_installed = {"c", "rust", "python", "lua", 
						"java", "julia", "html", "json"},
	
	highlight = {
		enable = true,
		-- list of language that will be disabled
		-- -- disable = {},
		additional_vim_regex_highlighting = false,
	},

	incremental_selection = {enable = false},
	indent = {enable = false}
}
