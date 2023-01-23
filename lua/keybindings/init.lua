vim.g.mapleader = '\\'

--[[
local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then options = vim.tbl_extend('force', options, opts) end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
]]

local map = vim.keymap.set

-- Maps


map(
	'n', '<leader><space>',
	':noh <CR>',
	{ silent = true }
)

map('n', '<leader>d', ':ToggleDiag<CR>')

map(
	'n', '<leader>h',
	function ()
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
	function ()
		if LSP_ON then
			vim.cmd('LspStop')
			LSP_ON = false
		else
			vim.cmd('LspStart')
			LSP_ON = true
		end
	end,
	{}
)

map(
	'n', '<leader>H',
	function ()
		if vim.o.list then
			vim.o.list = false
		else
			vim.o.list = true
		end
	end
)

map('n', '<leader>R', ':e!<CR>')

map('v', '>', '>gv')
map('v', '<', '<gv')
-- NOTE: talvez deva mudar isso depois para liberar o comando '>' puro.


-- Trouble

map('n', ',,', ":Trouble workspace_diagnostics<CR>")

-- Todo

map('n', ';.', ":TodoTelescope<CR>")
map('n', ';,', ":Trouble todo<CR>")
map('n', ';;', ":TodoLocList<CR>")

-- BufferLine

map('n', ']b', ':BufferLineCycleNext<CR>', { silent = true })
map('n', '[b', ':BufferLineCyclePrev<CR>', { silent = true })

map('n', 'm>', ':BufferLineMoveNext<CR>', { silent = true })
map('n', 'm<', ':BufferLineMovePrev<CR>', { silent = true })

map('n', 'sbe', ':BufferLineSortByExtension<CR>', { silent = true })
map('n', 'sbd', ':BufferLineSortByDirectory<CR>', { silent = true })

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
