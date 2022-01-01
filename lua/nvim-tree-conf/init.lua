
vim.g.nvim_tree_highlight_opened_files = 1

require'nvim-tree'.setup {
	disable_netrw = true,
	hijack_netrw = true,

	git = {
		enable = true,
		ignore = false,
		timeout = 500
	}
}

