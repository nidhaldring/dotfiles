-- telescope configs
require("telescope").setup {
	pickers = {
		find_files = {
			theme = "dropdown",
			hidden = true
		},
		live_grep = {
			theme = "dropdown",
			hidden = true
		}
	},
}
require('telescope').load_extension('fzf')
