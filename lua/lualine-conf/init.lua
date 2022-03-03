if false then
	require('custom1')
else
	require'lualine'.setup({
		options = {
			theme = 'dracula',
			-- section_separators = { left = '', right = ''},
			-- component_separators = { left = '', right = ''}
		}
	})
end

