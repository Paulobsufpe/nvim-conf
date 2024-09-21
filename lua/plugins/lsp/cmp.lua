vim.g.completeopt = "menu,menuone,noselect,noinsert"

local cmp_autopairs = require("nvim-autopairs.completion.cmp")

-- nvim-cmp
local cmp = require("cmp")

local luasnip = require("luasnip")
local lspkind = require("lspkind")

cmp.setup({
	snippet = {
		expand = function(args)
			-- For `vsnip` user.
			-- vim.fn["vsnip#anonymous"](args.body)

			-- For `luasnip` user.
			require('luasnip').lsp_expand(args.body)

			-- For `ultisnips` user.
			-- vim.fn["UltiSnips#Anon"](args.body)
		end
	},
	mapping = {

		["<Down>"] = cmp.mapping.select_next_item(),
		["<Up>"] = cmp.mapping.select_prev_item(),

		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		-- ['<C-l>'] = cmp.mapping.close(),
		['<C-l>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({
			-- behavior = cmp.ConfirmBehavior.Replace,
			-- select = true,
		}),

		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			-- elseif has_words_before() then
			-- 	cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
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
		{ name = 'nvim_lsp_signature_help' }
	},
	formatting = {
		format = lspkind.cmp_format({
			with_text = true,
			-- maxwidth = 56,
			menu = {
				nvim_lsp = "[lsp]",
				nvim_lua = "[api]",
				-- omni = "[omni]",
				luasnip = "[snip]",
				buffer = "[buf]",
				path = "[path]",
				-- gh_issues = "[issues]",
			},
		})
	}
})

cmp.event:on(
	'confirm_done',
	cmp_autopairs.on_confirm_done()
)

require("luasnip.loaders.from_vscode").lazy_load()
