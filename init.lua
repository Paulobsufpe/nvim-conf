
require("options")
require("keybindings")
require("plugins")

-- vim.cmd("colorscheme dracula")
vim.cmd("autocmd BufRead,BufNewFile *.porth set filetype=porth")
-- TODO: refatorar isso, colocando os autocmd's em um lugar apropriado
-- TODO: fazer limpa nos plugins. add cmp-commandline. ver sobre plugins canguru
vim.cmd("autocmd BufRead,BufNewFile *.nasm set filetype=nasm")
vim.cmd("autocmd BufRead,BufNewFile *.fasm set filetype=fasm")
-- vim.cmd("autocmd BufReadPre *.asm let g:asmsyntax = \"fasm\"")

-- TODO: considerar: nvim-surround, emet (?, html tags and etc.),
-- nvim-bqf, git-blame, fugitive

-- TODO: add callback for keybindings (ou o que?)
-- TODO: disable nvim welcome (é possível?)
-- TODO: QuickFixCmdPre event binding for run :w before :make
-- TODO: Mudar find_files do Telescope para ignorar git o vcs`s
