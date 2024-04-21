-- vim.cmd("filetype plugin indent on")
vim.o.termguicolors = true
-- vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.shortmess = vim.o.shortmess .. 'I'
vim.o.path = vim.o.path .. '**'
vim.o.hidden = true
vim.o.whichwrap = '<,>,[,],h,l'
vim.o.pumheight = 10
vim.o.fileencoding = 'utf-8'
vim.o.cmdheight = 2
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.conceallevel = 0
vim.o.showtabline = 2
vim.o.showmode = true
vim.o.backup = true
vim.o.backupdir = '.backup/,~/.local/state/nvim/backup//,/tmp//'
vim.o.writebackup = true
vim.o.updatetime = 500
vim.o.timeoutlen = 800
vim.o.ttimeoutlen = 45
-- vim.o.clipboard = 'unnamedplus'
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.scrolloff = 4
vim.o.sidescrolloff = 5
vim.o.mouse = 'a'
vim.wo.wrap = true
vim.wo.number = true
vim.wo.rnu = true
-- vim.o.cursorline = true
vim.wo.signcolumn = "yes"
vim.wo.colorcolumn = "+1"
vim.o.tabstop = 2
vim.o.shiftwidth = 0
vim.o.expandtab = false
vim.o.softtabstop = 0
vim.o.autoindent = true
-- vim.o.autochdir = true
vim.o.cinoptions = "l1"
-- vim.o.list = true
-- vim.opt.listchars = {eol = '↴', tab = '» ', space = '.'}
vim.opt.listchars = { eol = '↵', tab = '» ', space = '.' }

vim.g.do_filetype_lua = 1
vim.g.netrw_banner = false
vim.g.markdown_fenced_languages = {
	"ts=typescript"
}

-- NOTE: setup omnifunc without lua (i dont know other way)
-- vim.api.nvim_set_option('omnifunc', 'v:syntaxcomplete#Complete') -- não funciona
vim.cmd [[set omnifunc=syntaxcomplete#Complete]]

vim.cmd [[autocmd BufRead,BufNewFile *.ml
	\ set rtp+=$HOME/.opam/default/share/merlin/vim |
	\ set rtp^=$HOME/.opam/default/share/ocp-indent/vim]]

if vim.fn.executable('rg') == 1 then
	vim.o.grepformat = '%f:%l:%c:%m'
	vim.o.grepprg = 'rg --vimgrep --no-heading --smart-case --hidden'
end

vim.api.nvim_create_user_command('Redir', function(ctx)
	local ok, ret = pcall(vim.api.nvim_exec2, ctx.args, { output = true })
	if (not ok) then
		vim.print(ret); return
	end
	local out = ret.output
	local lines = vim.split(out, '\n', { plain = true })
	vim.cmd('new')
	vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
	vim.opt_local.modified = false
end, { nargs = '+', complete = 'command' })
