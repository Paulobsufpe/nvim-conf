vim.g.completeopt = "menu,menuone,noselect,noinsert"

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")

local luasnip = require("luasnip")
local lspkind = require("lspkind")

cmp.setup({
	mapping = {

		["<Down>"] = cmp.mapping.select_next_item(),
		["<Up>"] = cmp.mapping.select_prev_item(),

		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		-- ['<C-l>'] = cmp.mapping.close(),
		['<C-l>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),

		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif vim.snippet.active({ direction = 1 }) then
				vim.schedule(function()
					vim.snippet.jump(1)
				end)
			else
				fallback()
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif vim.snippet.active({ direction = -1 }) then
				vim.schedule(function()
					vim.snippet.jump(-1)
				end)
			else
				fallback()
			end
		end, { "i", "s" }),
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'nvim_lua' },
		-- { name = 'omni' },
		-- { name = 'vsnip' },
		-- For luasnip user.
		{ name = 'luasnip' },
		-- For ultisnips user.
		-- { name = 'ultisnips' },
		{ name = 'buffer' },
		{ name = 'path' },
		{ name = 'nvim_lsp_signature_help' },
		{
			name = 'lazydev',
			group_index = 0
		},
	},
	formatting = {
		format = lspkind.cmp_format({
			mode = 'symbol_text',
			maxwidth = {
				-- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
				-- can also be a function to dynamically calculate max width such as
				-- menu = function() return math.floor(0.40 * vim.o.columns) end,
				menu = 32, -- leading text (labelDetails)
				-- abbr = 50, -- actual suggestion item
			},
			ellipsis_char = '...',
			menu = {
				nvim_lsp = "[lsp]",
				nvim_lua = "[api]",
				lazydev = "[apiL]",
				-- omni = "[omni]",
				luasnip = "[snip]",
				buffer = "[buf]",
				path = "[path]",
				-- gh_issues = "[issues]",
			},
			show_labelDetails = true, -- show labelDetails in menu. Disabled by default
		})
	}
})

cmp.event:on(
	'confirm_done',
	cmp_autopairs.on_confirm_done()
)

require("luasnip.loaders.from_vscode").lazy_load()
