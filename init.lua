
require("options")
require("plugins")
require("keybindings")

-- vim.cmd("colorscheme dracula")
vim.cmd("autocmd BufRead,BufNewFile *.porth set filetype=porth")
-- vim.cmd("autocmd BufReadPre *.asm let g:asmsyntax = \"fasm\"")

-- TODO: add callback for keybindings (ou o que?)
-- TODO: disable nvim welcome
