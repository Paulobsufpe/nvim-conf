-- vim.cmd("filetype plugin indent on")
-- vim.o.autochdir = true
-- vim.o.list = true
-- vim.o.shortmess = vim.o.shortmess .. 'c'
-- vim.o.softtabstop = 0 -- the default
vim.o.autoindent = true
vim.o.backup = true
vim.o.backupdir = '.backup/,~/.local/state/nvim/backup//,/tmp//'
vim.o.cinoptions = "l1"
vim.o.cmdheight = 2
vim.o.conceallevel = 0
vim.o.confirm = true
vim.o.cursorline = true
vim.o.expandtab = false
vim.o.fileencoding = 'utf-8'
vim.o.hidden = true
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.inccommand = "split"
vim.o.mouse = 'a'
vim.o.path = vim.o.path .. '**'
vim.o.pumheight = 10
vim.o.scrolloff = 6
vim.o.shiftwidth = 0
vim.o.shortmess = vim.o.shortmess .. 'I'
vim.o.showmode = false
vim.o.showtabline = 2
vim.o.sidescrolloff = 5
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.tabstop = 2
vim.o.termguicolors = true
vim.o.timeoutlen = 400
vim.o.ttimeoutlen = 45
vim.o.undofile = true
vim.o.updatetime = 250
vim.o.whichwrap = '<,>,[,],h,l'
vim.o.writebackup = true

vim.opt.listchars = { eol = '↵', tab = '» ', space = '.', trail = '·', nbsp = '␣' }

vim.wo.colorcolumn = "+1"
vim.wo.number = true
vim.wo.rnu = true
vim.wo.signcolumn = "yes"
vim.wo.wrap = true

-- NOTE: ensure this!
vim.g.have_nerd_font = true
vim.g.markdown_fenced_languages = { "ts=typescript", "js=javascript", "html", "python", "bash=sh" }
vim.g.netrw_banner = false

vim.cmd [[autocmd BufRead,BufNewFile *.ml
	\ set omnifunc=syntaxcomplete#Complete |
	\ set rtp+=$HOME/.opam/default/share/merlin/vim |
	\ set rtp^=$HOME/.opam/default/share/ocp-indent/vim]]

if vim.fn.executable('rg') == 1 then
	vim.o.grepformat = '%f:%l:%c:%m'
	vim.o.grepprg = 'rg --vimgrep --no-heading'
end

vim.api.nvim_create_user_command('Redir', function(ctx)
	local ok, ret = pcall(vim.api.nvim_exec2, ctx.args, { output = true })
	if (not ok) then
		vim.print(ret); return
	end
	local out = ret.output
	local lines = vim.split(out, '\n', { plain = true })
	vim.cmd.new()
	vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
	vim.opt_local.modified = false
end, { nargs = '+', complete = 'command' })

vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
