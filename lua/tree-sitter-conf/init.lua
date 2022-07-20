require 'nvim-treesitter.configs'.setup {
	ensure_installed = {
		"c", "rust", "cpp", "java",
		"lua", "julia", "html", "json",
		"c_sharp", "scala", "python", "dot",
		"make", "markdown", "javascript", "typescript",
		"bash", "css", "yaml"
	},

	highlight = {
		enable = true,
		-- list of language that will be disabled
		-- disable = {},
		additional_vim_regex_highlighting = false,
	},

	incremental_selection = { enable = false },
	indent = { enable = false }
}
