local actions = require('telescope.actions')
local previewers = require('telescope.previewers')


-- Clone the default Telescope configuration
local telescopeConfig = require('telescope.config')
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

-- I want to search in hidden/dot files.
table.insert(vimgrep_arguments, '--hidden')
-- I don't want to search in the `.git` directory.
table.insert(vimgrep_arguments, '--glob')
table.insert(vimgrep_arguments, '!**/.git/*')
-- table.insert(vimgrep_arguments, '--trim')

require('telescope').setup {
	defaults = {
		layout_strategy = 'vertical',
		prompt_prefix = ' ',
		path_display = {},
		color_devicons = true,
		-- set_env = { ['COLORTERM'] = 'truecolor' },
		-- mappings = { i = { ['<esc>'] = actions.close } },
		winblend = 0,
		-- `hidden = true` is not supported in text grep commands.
		vimgrep_arguments = vimgrep_arguments
	},
	pickers = {
		find_files = {
			theme = 'ivy',
			layout_config = {
				preview_cutoff = 50
			},
			preview = true,
			find_command = {
				'fd',
				'-IH',
				'-c', 'never',
				'-t', 'f',
				'--strip-cwd-prefix',
				'-E', '**/.git/*'
			}
		},
		live_grep = {
			layout_config = {
				preview_cutoff = 10
			},
			preview = true
		},
		git_files = {
			theme = 'ivy',
			layout_config = {
				preview_cutoff = 50
			},
			preview = true
		},
		lsp_code_actions = {
			layout_strategy = 'cursor',
			prompt_title = 'Actions',
			results_title = '',
			layout_config = {
				height = 0.75,
				width = 0.75
			}
		},
		lsp_references = {
			layout_config = {
				preview_cutoff = 10
			},
			preview = true
		},
		diagnostics = {
			layout_config = {
				preview_cutoff = 10
			},
			preview = true
		},
		buffers = {
			theme = 'ivy',
			layout_config = {
				preview_cutoff = 50
			},
			preview = true
		}
	},
	extensions = {
		fzf = {
			fuzzy = true,                -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case",    -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		}
	}
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')


local map = vim.keymap.set
local builtin = require('telescope.builtin')
local opts = { noremap = true, silent = true }

map('n', '<space>t', builtin.builtin, {})
map('n', '<space>z', builtin.current_buffer_fuzzy_find, {})
map('n', '<space>f', builtin.find_files, {})
map('n', '<space>G', builtin.git_files, {})
map('n', '<space>g', builtin.live_grep, {})
map('n', '<space>b', builtin.buffers, {})
map('n', '<space>h', builtin.help_tags, {})
map('n', '<space>c', builtin.commands, {})
map('n', '<space>S', builtin.symbols, {})

map('n', '<space>d', builtin.lsp_definitions, opts)
map('n', '<space>r', builtin.lsp_references, opts)
map('n', '<space>sw', builtin.lsp_dynamic_workspace_symbols, opts)
map('n', '<space>,', builtin.diagnostics, opts)
