require('nvim-tree').setup {
	disable_netrw = true,
	hijack_netrw = true,
	update_focused_file = { enable = true },
	sync_root_with_cwd = true,
	prefer_startup_root = true,

	git = {
		enable = true,
		ignore = false,
		timeout = 500
	}
}

