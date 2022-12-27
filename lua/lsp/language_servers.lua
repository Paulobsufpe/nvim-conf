require('neodev').setup {}
require('neoconf').setup {}
local lsp_installer = require('nvim-lsp-installer')
local lspconf = require('lspconfig')

local capabilities = require('cmp_nvim_lsp')
		.default_capabilities()

lsp_installer.setup {}

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
				library = vim.tbl_extend(
					"force", vim.api.nvim_get_runtime_file('', true),
					{ ["/usr/local/share/lua"] = true }
				),
				-- checkThirdParty = false
			},
			telemetry = { enable = false }
		}
	}
})

function get_lua_paths()
	local lua_path = os.getenv("LUA_PATH")
	if not lua_path then
		os.execute("source <(luarocks path)")
	end
end

get_lua_paths()

lspconf.pylsp.setup({
	capabilities = capabilities
})

lspconf.omnisharp.setup({
	cmd = {
		'dotnet',
		'/Users/paulobs/.local/share/nvim/lsp_servers\
		/omnisharp/omnisharp/OmniSharp.dll'
	},
	capabilities = capabilities
})

lspconf.fsautocomplete.setup({
	capabilities = capabilities
})

lspconf.jdtls.setup({
	capabilities = capabilities
})

lspconf.sourcekit.setup({
	capabilities = capabilities,
	filetypes = { 'swift', 'objective-c', 'objective-cpp' },
})

local function get_clangd()
	local clangd_path = os.getenv("CLANGD")
	if clangd_path == nil then
		return "clangd"
	else
		return clangd_path
	end
end

lspconf.clangd.setup({
	cmd = { get_clangd() },
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
	capabilities = capabilities
})
