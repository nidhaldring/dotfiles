-- -- empty setup using defaults
-- require("nvim-tree").setup({
-- 	update_focused_file = {
-- 		enable = true,
-- 	},
-- })

require("oil").setup({
	keymaps = {
		["<C-p>"] = false,
	},
	view_options = {
		show_hidden = true,
	},
	columns = {
		"icon",
	},
})
