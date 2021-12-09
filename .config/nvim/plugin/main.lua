local actions = require "telescope.actions"
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ["<C-h>"] = "which_key",
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
      }
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
require'nvim-web-devicons'.setup()
require'nvim-tree'.setup {
	filters = {
		custom = {'.git', '.pytest_cache', '__pycache__', '*.egg-info'}
	}
}
require('telescope').load_extension('coc')
local tree_cb = require'nvim-tree.config'.nvim_tree_callback
require'nvim-tree'.setup {
	 view = {
		  mappings = {
      custom_only = false,
			list = {
				{ key = "<C-s>",                        cb = tree_cb("vsplit") }
			}
    },
	}
}
