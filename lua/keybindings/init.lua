
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

map(
	'n', '<leader>h', 
	":lua vim.cmd(vim.b.current_syntax and 'syntax off | TSBufEnable highlight' or 'syntax on | TSBufDisable highlight')<CR>",
	{silent = true}
)

map('v', '>', '>gv')
map('v', '<', '<gv')

-- Telescope

map('n', 't', ':Telescope<CR>')
map('n', '<C-f>', ":Telescope current_buffer_fuzzy_find<CR>")
map('n', 'ff', ":Telescope find_files<CR>")
map('n', 'fg', ":Telescope live_grep<CR>")
map('n', 'fb', ":Telescope buffers<CR>")
map('n', 'fh', ":Telescope help_tags<CR>")
map('n', 'fc', ":Telescope commands<CR>")

-- BufferLine

map('n', ']b', ':BufferLineCycleNext<CR>', {silent=true})
map('n', '[b', ':BufferLineCyclePrev<CR>', {silent=true})

map('n', 'sbe', ':BufferLineSortByExtension<CR>', {silent=true})
map('n', 'sbd', ':BufferLineSortByDirectory<CR>', {silent=true})

--[[
" These commands will navigate through buffers in order regardless of which mode you are using
" e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
nnoremap <silent>]b :BufferLineCycleNext<CR>
nnoremap <silent>[b :BufferLineCyclePrev<CR>

" These commands will move the current buffer backwards or forwards in the bufferline
" nnoremap <silent><mymap> :BufferLineMoveNext<CR>
" nnoremap <silent><mymap> :BufferLineMovePrev<CR>

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


