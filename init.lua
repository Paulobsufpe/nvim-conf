
require("options")
require("plugins")
require("keybindings")

-- vim.cmd("colorscheme dracula")
vim.cmd("autocmd BufRead,BufNewFile *.porth set filetype=porth")
-- vim.cmd("autocmd BufReadPre *.asm let g:asmsyntax = \"fasm\"")

-- TODO: tentar trocar a ordem de lazy load entre treesitter e polyglot.
-- TODO: add callback for keybindings (ou o que?)
