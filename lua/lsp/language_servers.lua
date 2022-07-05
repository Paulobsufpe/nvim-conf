local lsp_installer = require('nvim-lsp-installer')
local lspconf = require('lspconfig')

local capabilities = require('cmp_nvim_lsp')
	.update_capabilities(
		vim.lsp.protocol.make_client_capabilities())

lsp_installer.setup({ capabilities = capabilities })

lspconf.sumneko_lua.setup({
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = { version = 'LuaJIT', path = vim.split(package.path, ';') },
			diagnostics = { globals = { 'vim' } },
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false
			},
			telemetry = { enable = false }
		}
	}
})

lspconf.sourcekit.setup({
	capabilities = capabilities,
	filetypes = { "swift", "objective-c", "objective-cpp" },
	single_file_support = true
})

lspconf.clangd.setup({
	capabilities = capabilities,
	filetypes = { "c", "cpp" }
})


lspconf.rust_analyzer.setup({
	autostart = false,
	capabilities = capabilities
})


lspconf.denols.setup({
	capabilities = capabilities
})
