vim.g.mapleader = '\\'
-- vim.g.maplocalleader = ','

--[[
local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then options = vim.tbl_extend('force', options, opts) end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
]]
local map = vim.keymap.set

-- Maps

map('n', '<leader>d', ':ToggleDiag<CR>')

map(
	'n', '<leader>h',
	function()
		if vim.b.current_syntax then
			vim.cmd('syntax off | TSBufEnable highlight')
		else
			vim.cmd('syntax on | TSBufDisable highlight')
		end
	end,
	{ silent = true }
)

map(
	'n', '<leader>l',
	function()
		local bufnr = vim.api.nvim_get_current_buf()
		local on = false
		-- não sei fazer isso de um jeito melhor com a api disponível
		for _, client in pairs(vim.lsp.get_clients({ bufnr = bufnr })) do
			print(vim.inspect(client))
			on = true
		end

		require('lspconfig')
		if on then
			vim.cmd('LspStop')
		else
			vim.cmd('LspStart')
		end
	end,
	{}
)

map(
	'n', '<leader>H',
	function()
		if vim.o.list then
			vim.o.list = false
		else
			vim.o.list = true
		end
	end
)

map('n', '<leader>R', ':e!<CR>')

-- BUG: Doesnt work anymore. Really dont know why :(
-- map('v', '>', '>gv')
-- map('v', '<', '<gv')

map('i', '<c-Left>', '<home>')
map('i', '<c-Right>', '<end>')

map('n', '<m-Left>', '<c-w><Left>')
map('n', '<m-Right>', '<c-w><Right>')
map('n', '<m-Up>', '<c-w><Up>')
map('n', '<m-Down>', '<c-w><Down>')

map('n', '<m-t>', ':terminal<cr>')

-- Tabs

map('n', ']t', ':tabnext<CR>', { silent = true })
map('n', '[t', ':tabNext<CR>', { silent = true })

-- Quickfix list, Loc list, etc

map('n', '<leader>E', ":cw<cr>")
map('n', '[e', ":cN<cr>")
map('n', ']e', ":cn<cr>")

map('n', '<leader>L', ":lw<cr>")
map('n', '[l', ":lNext<cr>")
map('n', ']l', ":lnext<cr>")

map('n', '<space>m', ":mak ", { silent = false })

-- Trouble

map('n', ',,', ":Trouble diagnostics<CR>")

-- Todo

map('n', ';.', ":TodoTelescope<CR>")
map('n', ';,', ":Trouble todo<CR>")
map('n', ';;', ":TodoLocList<CR>")

-- BufferLine

map('n', ']b', ':BufferLineCycleNext<CR>', { silent = true })
map('n', '[b', ':BufferLineCyclePrev<CR>', { silent = true })
-- map('n', ']b', ':bnext<CR>', { silent = true })
-- map('n', '[b', ':bNext<CR>', { silent = true })

-- map('n', 'm>', ':BufferLineMoveNext<CR>', { silent = true })
-- map('n', 'm<', ':BufferLineMovePrev<CR>', { silent = true })
--
-- map('n', 'sbe', ':BufferLineSortByExtension<CR>', { silent = true })
-- map('n', 'sbd', ':BufferLineSortByDirectory<CR>', { silent = true })

--[[
" These commands will sort buffers by directory, language, or a custom criteria
nnoremap <silent>sbe :BufferLineSortByExtension<CR>
nnoremap <silent>sbd :BufferLineSortByDirectory<CR>
" nnoremap <silent><mymap> :lua require'bufferline'.sort_buffers_by(function (buf_a, buf_b) return buf_a.id < buf_b.id end)<CR>
--]]


-- Nvim-Tree

map('n', '<space>n', ':NvimTreeToggle<CR>', { silent = true })
map('n', '<leader>r', ':NvimTreeRefresh<CR>', { silent = true })
map('n', '<leader>n', ':NvimTreeFindFile<CR>', { silent = true })

-- move.nvim

local opts = { noremap = true, silent = true }
-- Normal-mode commands
map('n', '<C-j>', ':MoveLine(1)<CR>', opts)
map('n', '<C-k>', ':MoveLine(-1)<CR>', opts)
-- map('n', '<A-h>', ':MoveHChar(-1)<CR>', opts)
-- map('n', '<A-l>', ':MoveHChar(1)<CR>', opts)
map('n', '<leader>wf', ':MoveWord(1)<CR>', opts)
map('n', '<leader>wb', ':MoveWord(-1)<CR>', opts)

-- Visual-mode commands
map('v', '<C-j>', ':MoveBlock(1)<CR>', opts)
map('v', '<C-k>', ':MoveBlock(-1)<CR>', opts)
-- map('v', '<A-h>', ':MoveHBlock(-1)<CR>', opts)
-- map('v', '<A-l>', ':MoveHBlock(1)<CR>', opts)

-- Terminal-mode commands
map('t', '<C-x>', '<C-\\><C-n>')
map('t', '<m-Left>', '<C-\\><C-n><c-w><Left>')
map('t', '<m-Right>', '<C-\\><C-n><c-w><Right>')
map('t', '<m-Up>', '<C-\\><C-n><c-w><Up>')
map('t', '<m-Down>', '<C-\\><C-n><c-w><Down>')
