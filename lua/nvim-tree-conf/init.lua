
require'nvim-tree'.setup {
	disable_netrw = true,
	hijack_netrw = true,
	nvim_tree_highlight_opened_files = 1,

	git = {
		enable = true,
		ignore = false,
		timeout = 500
	}
}

