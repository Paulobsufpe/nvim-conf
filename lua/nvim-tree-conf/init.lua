
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_highlight_opened_files = 1

require'nvim-tree'.setup {
	auto_close    = false,
	disable_netrw = true,
	hijack_netrw = true,
	-- open_on_setup = true,

	git = {
		enable = true,
		ignore = false,
		timeout = 500
	}
}

