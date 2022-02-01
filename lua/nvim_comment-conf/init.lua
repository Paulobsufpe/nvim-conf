
require('nvim_comment').setup {}

vim.cmd[[
" when you enter a (new) buffer
augroup set-commentstring-ag
autocmd!
autocmd BufEnter *.c,*.cpp,*.h :lua vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
" when you've changed the name of a file opened in a buffer, the file type may have changed
autocmd BufFilePost *c,*.cpp,*.h :lua vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
augroup END
]]
