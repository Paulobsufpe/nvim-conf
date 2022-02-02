local actions = require('telescope.actions')
local previewers = require('telescope.previewers')

require('telescope').setup {
  defaults = {
    layout_strategy = 'vertical',
    preview = false,
	layout_config = {
	},
	find_command = {
      'rg', 
      '--color=never',
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
      theme = 'ivy',
      layout_config = {
        preview_cutoff = 50
      }
    },
    live_grep = {
      layout_strategy = 'vertical',
      layout_config = {
        preview_cutoff = 10
      },
      preview = true
    },
    lsp_code_actions = {
      layout_strategy =  'cursor',
      prompt_title = 'Actions',
      results_title = '',
      layout_config = {
        height = 8,
        width = 0.6
      }
    },
    lsp_references = {
      layout_config = {
        preview_cutoff = 10
      },
      preview = true
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

