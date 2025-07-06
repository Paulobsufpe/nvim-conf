require('neoconf').setup {}
local capabilities = require('cmp_nvim_lsp')
		.default_capabilities()

-- Mappings
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local map = vim.keymap.set
local opts = { noremap = true, silent = true }
map('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	-- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
	local bufopts = { noremap = true, silent = true, buffer = bufnr }

	map('n', '<space>I', function()
		if client.server_capabilities.inlayHintProvider then
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
		else
			vim.print("Inlay Hint não suportado pelo LSP")
		end
	end, { noremap = true, silent = false })

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	map('n', 'gD', vim.lsp.buf.declaration, bufopts)
	map('n', 'gd', vim.lsp.buf.definition, bufopts)

	map('n', '<C-S>', vim.lsp.buf.signature_help, bufopts)
	map('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
	map('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
	map('n', '<space>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, { silent = false, buffer = bufnr })
	map('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
	map('n', '<space>F', function() vim.lsp.buf.format { async = true } end, bufopts)
	map('n', '<space>.', ":lua vim.lsp.buf.", { silent = false, buffer = bufnr })
end

-- End Mappings

vim.lsp.enable('lua_ls')
vim.lsp.config('lua_ls', {
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

vim.lsp.enable('pylsp')
vim.lsp.config('pylsp', {
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

vim.lsp.enable('sourcekit')
vim.lsp.config('sourcekit', {
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

vim.lsp.enable('clangd')
vim.lsp.config('clangd', {
	on_attach = on_attach,
	autostart = false,
	cmd = { get_clangd() },
	capabilities = capabilities,
	filetypes = { 'c', 'cpp' }
})

vim.lsp.enable('rust_analyzer')
vim.lsp.config('rust_analyzer', {
	on_attach = on_attach,
	autostart = false,
	cmd = { 'rustup', 'run', 'stable', 'rust-analyzer' },
	capabilities = capabilities
})

vim.lsp.enable('denols')
vim.lsp.config('denols', {
	on_attach = on_attach,
	autostart = false,
	capabilities = capabilities
})

vim.lsp.enable('texlab')
vim.lsp.config('texlab', {
	on_attach = on_attach,
	autostart = false,
	capabilities = capabilities
})

vim.lsp.enable('zls')
vim.lsp.config('zls', {
	on_attach = on_attach,
	autostart = false,
	capabilities = capabilities
})

vim.lsp.enable('ocamllsp')
vim.lsp.config('ocamllsp', {
	on_attach = on_attach,
	autostart = false,
	capabilities = capabilities
})

vim.lsp.enable('hls')
vim.lsp.config('hls', {
	on_attach = on_attach,
	autostart = false,
	capabilities = capabilities,
	filetypes = { 'haskell', 'lhaskell', 'cabal' }
})
