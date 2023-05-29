
require("options")
require("keybindings")
require("plugins")

-- vim.cmd("colorscheme dracula")
vim.cmd("autocmd BufRead,BufNewFile *.porth set filetype=porth")
-- vim.cmd("autocmd BufReadPre *.asm let g:asmsyntax = \"fasm\"")

-- TODO: considerar: nvim-surround, emet (?, html tags and etc.),
-- nvim-bqf, git-blame, fugitive

-- TODO: add callback for keybindings (ou o que?)
-- TODO: disable nvim welcome (é possível?)
-- TODO: QuickFixCmdPre event binding for run :w before :make
-- TODO: Mudar find_files do Telescope para ignorar git o vcs`s
