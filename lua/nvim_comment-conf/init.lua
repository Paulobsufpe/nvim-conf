
require('nvim_comment').setup {}

local group_commentstring = vim.api.nvim_create_augroup("set-commentstring-ag", {clear = true})
local function set_c_commentstring()
	vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
end

vim.api.nvim_create_autocmd(
	"BufEnter *.c,*.cpp,*.h", 
	{
		callback = function ()
			set_c_commentstring()
		end,
		group = group_commentstring,
	}
)
vim.api.nvim_create_autocmd(
	"BufFilePost *c,*.cpp,*.h", 
	{
		callback = function ()
			set_c_commentstring()
		end,
		group = group_commentstring,
	}
)
