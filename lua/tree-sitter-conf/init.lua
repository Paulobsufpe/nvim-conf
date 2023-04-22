require 'nvim-treesitter.configs'.setup {
	ensure_installed = {
		"c", "rust", "cpp", "java",
		"lua", "julia", "html", "json",
		"c_sharp", "scala", "python", "dot",
		"markdown", "javascript", "typescript",
		"css", "yaml", "zig"
	},

	highlight = {
		enable = true,
		-- list of language that will be disabled
		-- disable = {},
		disable = function(lang, buf)
			local max_filesize = 5000 * 1024 -- 5_000 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,
		additional_vim_regex_highlighting = false,
	},

	incremental_selection = { enable = false },
	indent = { enable = false }
}
