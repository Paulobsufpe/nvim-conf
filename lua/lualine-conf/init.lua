if true then
	require('lualine-conf/custom_bubbles_line')
else
	require'lualine'.setup({
		options = {
			theme = 'dracula',
			-- section_separators = { left = '', right = ''},
			-- component_separators = { left = '', right = ''}
		}
	})
end

