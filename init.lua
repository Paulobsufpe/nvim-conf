
require("options")
require("plugins")
require("keybindings")

-- vim.cmd("colorscheme dracula")
vim.cmd("autocmd BufRead,BufNewFile *.porth set filetype=porth")
-- vim.cmd("autocmd BufReadPre *.asm let g:asmsyntax = \"fasm\"")

-- TODO: add callback for keybindings (ou o que?)
-- TODO: disable nvim welcome (é possível?)
-- TODO: reescrever a configuração de lsp (tomar de exemplo o github do nvim-lspconfig) ... lembrar de usar on_attach e criar bindings para `vim.diagnostic` também. (pesquisar para usar a mais nova API de keymaps)
-- TODO: QuickFixCmdPre event binding for run :w before :make
-- TODO: Avaliar mudar os atalhos para usar o cmd default  '.', ou remapear para outra tecla
-- TODO: Mudar find_files do Telescope para ignorar git o vcs`s
