vim.cmd("filetype plugin indent on")
vim.o.termguicolors = true
-- vim.o.shortmess = vim.o.shortmess .. 'c'
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
vim.o.backupdir = '.backup/,/Users/paulobs/.local/share/nvim/backup//,/tmp//'
vim.o.writebackup = true
vim.o.updatetime = 500
vim.o.timeoutlen = 800
vim.o.ttimeoutlen = 45
-- vim.o.clipboard = 'unnamedplus'
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.scrolloff = 3
vim.o.sidescrolloff = 5
vim.o.mouse = 'a'
vim.wo.wrap = true
vim.wo.number = true
vim.wo.rnu = true
-- vim.o.cursorline = true
vim.wo.signcolumn = "yes"
vim.o.tabstop = 4
vim.o.expandtab = false
vim.o.shiftwidth = 4
vim.o.softtabstop = 0
vim.o.autoindent = true
-- vim.o.autochdir = true
vim.o.cinoptions = "l1"
vim.opt.listchars = {eol = '↵', tab = '» ', space = '.'}
vim.o.list = true

vim.g.do_filetype_lua = 1
vim.g.netrw_banner = false
vim.g.markdown_fenced_languages = {
  "ts=typescript"
}
