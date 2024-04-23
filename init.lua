
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
-- TODO: add tabout.nvim

if vim.g.neovide then
	-- vim.g.neovide_font_features = {
	-- 	["JetbrainsMono Nerd Font"] = {
	-- 		"-liga",
	-- 		"-clig",
	-- 		"-dlig",
	-- 		"-hlig",
	-- 		"-rlig",
	-- 	}
	-- }
	vim.o.guifont = "JetbrainsMonoNL Nerd Font:h13"
	-- vim.o.guifont = "Iosevka Nerd Font:h13"

	vim.g.neovide_scale_factor = 1.0
	local change_scale_factor = function(delta)
		-- vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
		vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + delta
	end
	vim.keymap.set("n", "<C-=>", function()
		change_scale_factor(0.1)
		print("scale: " .. vim.g.neovide_scale_factor)
	end)
	vim.keymap.set("n", "<C-->", function()
		change_scale_factor(-0.1)
		print("scale: " .. vim.g.neovide_scale_factor)
	end)
	vim.g.neovide_cursor_animate_in_insert_mode = false
	vim.g.neovide_cursor_vfx_mode = "wireframe"
end
