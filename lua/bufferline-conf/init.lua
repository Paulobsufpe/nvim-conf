require("bufferline").setup {
	options = {
		diagnostics = "nvim_lsp",
		-- buffer_close_icon = '',
		modified_icon = '●',
		-- close_icon = 'X',
		separator_style = 'thin',
    always_show_bufferline = true,
		indicator = {
			icon = '▎',
			style = 'icon'
		}
	}
}
