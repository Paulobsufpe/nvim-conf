require('neoconf').setup {}
local lspconf = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp')
		.default_capabilities(capabilities)

-- Mappings
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local map = vim.keymap.set
local opts = { noremap = true, silent = true }
map('n', '<space>e', vim.diagnostic.open_float, opts)
map('n', '[d', vim.diagnostic.goto_prev, opts)
map('n', ']d', vim.diagnostic.goto_next, opts)
map('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	-- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
	local bufopts = { noremap = true, silent = true, buffer = bufnr }

	map('n', '<space>I', function()
		if client.server_capabilities.inlayHintProvider then
			vim.lsp.inlay_hint.enable(0, not vim.lsp.inlay_hint.is_enabled())
		else
			vim.print("Inlay Hint não suportado pelo LSP")
		end
	end, { noremap = true, silent = false })

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	map('n', 'gD', vim.lsp.buf.declaration, bufopts)
	map('n', 'gd', vim.lsp.buf.definition, bufopts)
	map('n', 'K', vim.lsp.buf.hover, bufopts)
	map('n', 'gI', vim.lsp.buf.implementation, bufopts)
	map('n', 'gr', vim.lsp.buf.references, bufopts)

	map('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
	map('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
	map('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
	map('n', '<space>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, { silent = false, buffer = bufnr })
	map('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
	map('n', '<space>R', vim.lsp.buf.rename, bufopts)
	map('n', '<space>a', vim.lsp.buf.code_action, bufopts)
	map('n', '<space>F', function() vim.lsp.buf.format { async = true } end, bufopts)
	map('n', '<space>.', ":lua vim.lsp.buf.", { silent = false, buffer = bufnr })
end

-- End Mappings

lspconf.lua_ls.setup({
	on_attach = on_attach,
	autostart = false,
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
			},
			diagnostics = {
				globals = { 'vim' },
			},
			-- NOTE: seams like lazydev will do that for me
			-- workspace = {
			-- 	library = vim.env.VIMRUNTIME,
			-- 	-- library = vim.api.nvim_get_runtime_file("", true),
			-- 	checkThirdParty = false,
			-- },
			telemetry = {
				enable = false,
			},
			hint = {
				enable = true,
			},
		},
	},
})

lspconf.pylsp.setup({
	on_attach = on_attach,
	autostart = false,
	capabilities = capabilities,
	settings = {
		pylsp = {
			plugins = {
				pycodestyle = { enabled = false },
				pydocstyle = { enabled = false },
			}
		}
	}
})

lspconf.sourcekit.setup({
	on_attach = on_attach,
	autostart = false,
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
	on_attach = on_attach,
	autostart = false,
	cmd = { get_clangd() },
	capabilities = capabilities,
	filetypes = { 'c', 'cpp' }
})

lspconf.rust_analyzer.setup({
	on_attach = on_attach,
	autostart = false,
	cmd = { 'rustup', 'run', 'stable', 'rust-analyzer' },
	capabilities = capabilities
})

lspconf.denols.setup({
	on_attach = on_attach,
	autostart = false,
	capabilities = capabilities
})

lspconf.texlab.setup({
	on_attach = on_attach,
	autostart = false,
	capabilities = capabilities
})

lspconf.zls.setup({
	on_attach = on_attach,
	autostart = false,
	capabilities = capabilities
})

lspconf.ocamllsp.setup({
	on_attach = on_attach,
	autostart = false,
	capabilities = capabilities
})

lspconf.hls.setup({
	on_attach = on_attach,
	autostart = false,
	capabilities = capabilities,
	filetypes = { 'haskell', 'lhaskell', 'cabal' }
})
