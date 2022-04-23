
vim.g.mapleader = '\\'

local function map(mode, lhs, rhs, opts)
	local options = {noremap = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Maps


map(
	'n', '<leader><space>', 
	-- ':set hlsearch! hlsearch? <CR>',
	':noh <CR>', 
	{silent=true}
)

map('n', '<leader>d', ':ToggleDiag<CR>')

map(
	'n', '<leader>h', 
	":lua vim.cmd(vim.b.current_syntax and 'syntax off | TSBufEnable highlight' or 'syntax on | TSBufDisable highlight')<CR>",
	{silent=true}
)

map('v', '>', '>gv')
map('v', '<', '<gv')

-- LSP

map('n', 'K', ':lua vim.lsp.buf.hover()<CR>')
map('n', '.R', ':lua vim.lsp.buf.rename()<CR>')

-- Telescope

map('n', '.t', ':Telescope<CR>')
map('n', '<C-f>', ":Telescope current_buffer_fuzzy_find<CR>")
map('n', '.f', ":Telescope find_files<CR>")
map('n', '.g', ":Telescope live_grep<CR>")
map('n', '.b', ":Telescope buffers<CR>")
map('n', '.h', ":Telescope help_tags<CR>")
map('n', '.c', ":Telescope commands<CR>")
map('n', '..', ":Telescope lsp_code_actions<CR>")
map('n', '.a', ":Telescope lsp_range_code_actions<CR>")
map('n', '.r', ":Telescope lsp_references<CR>")
map('n', '.d', ":Telescope lsp_definitions<CR>")
map('n', '.s', ":Telescope lsp_dynamic_workspace_symbols<CR>")
map('n', '.S', ":Telescope symbols<CR>")
map('n', '.,', ":Telescope diagnostics<CR>")

-- Trouble

map('n', ',,', ":Trouble workspace_diagnostics<CR>")

-- Todo

map('n', ';.', ":TodoTelescope<CR>")
map('n', ';,', ":Trouble todo<CR>")
map('n', ';;', ":TodoLocList<CR>")

-- BufferLine

map('n', ']b', ':BufferLineCycleNext<CR>', {silent=true})
map('n', '[b', ':BufferLineCyclePrev<CR>', {silent=true})

map('n', 'm>', ':BufferLineMoveNext<CR>', {silent=true})
map('n', 'm<', ':BufferLineMovePrev<CR>', {silent=true})

map('n', 'sbe', ':BufferLineSortByExtension<CR>', {silent=true})
map('n', 'sbd', ':BufferLineSortByDirectory<CR>', {silent=true})

--[[
" These commands will sort buffers by directory, language, or a custom criteria
nnoremap <silent>sbe :BufferLineSortByExtension<CR>
nnoremap <silent>sbd :BufferLineSortByDirectory<CR>
" nnoremap <silent><mymap> :lua require'bufferline'.sort_buffers_by(function (buf_a, buf_b) return buf_a.id < buf_b.id end)<CR>
--]]

-- Nvim-Tree

map('n', '<space>n', ':NvimTreeToggle<CR>', {silent=true})
map('n', '<leader>r', ':NvimTreeRefresh<CR>', {silent=true})
map('n', '<leader>n', ':NvimTreeFindFile<CR>', {silent=true})

--[[
nnoremap <space>n :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
--]]


