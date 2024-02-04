-- empty setup using defaults
require("nvim-tree").setup({
	update_focused_file = {
		enable = true,
	},
})

-- close nivm tree when it's the last window
-- vim.api.nvim_create_autocmd({ "QuitPre" }, {
-- 	callback = function()
-- 		vim.cmd("NvimTreeClose")
-- 	end,
-- })
