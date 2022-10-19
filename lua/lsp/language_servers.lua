local lsp_installer = require('nvim-lsp-installer')
local lspconf = require('lspconfig')

local capabilities = require('cmp_nvim_lsp')
	.default_capabilities(
		vim.lsp.protocol.make_client_capabilities())

lsp_installer.setup({ capabilities = capabilities })

lspconf.sumneko_lua.setup({
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = { 
				version = 'LuaJIT', 
				path = vim.split(package.path, ';') 
			},
			diagnostics = { globals = { 'vim' } },
			workspace = {
				library = vim.api.nvim_get_runtime_file('', true),
				checkThirdParty = false
			},
			telemetry = { enable = false }
		}
	}
})

lspconf.pylsp.setup({
	capabilities = capabilities
})

lspconf.omnisharp.setup({
	cmd = {
		'dotnet', 
		'/Users/paulobs/.local/share/nvim/lsp_servers\
		/omnisharp/omnisharp/OmniSharp.dll'
	},
	capabilities = capabilities,
	single_file_support = true
})

lspconf.jdtls.setup({
	capabilities = capabilities
})

lspconf.sourcekit.setup({
	capabilities = capabilities,
	filetypes = { 'swift', 'objective-c', 'objective-cpp' },
	single_file_support = true
})

lspconf.clangd.setup({
	capabilities = capabilities,
	filetypes = { 'c', 'cpp' }
})

lspconf.rust_analyzer.setup({
	cmd = { 'rustup', 'run', 'stable', 'rust-analyzer' },
	capabilities = capabilities
})

lspconf.denols.setup({
	capabilities = capabilities
})

lspconf.metals.setup({
	autostart = false,
	capabilities = capabilities,
	single_file_support = true
})
