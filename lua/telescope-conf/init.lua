local actions = require('telescope.actions')
require('telescope').setup {
  defaults = {
	previewer = true,
    layout_strategy = "horizontal",
	layout_config = {
	  preview_cutoff = 55
	},
	find_command = {
      'rg', 
      '--no-heading', 
      '--with-filename', 
      '--line-number', 
      '--column', 
      '--smart-case'
    },
    prompt_prefix = " ",
	path_display = {},
	color_devicons = true,
	set_env = {['COLORTERM'] = 'truecolor'},
	mappings = { i = { ["<esc>"] = actions.close } },
	winblend = 0
  },
  pickers = {
    find_files = {
      theme = "ivy",
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

