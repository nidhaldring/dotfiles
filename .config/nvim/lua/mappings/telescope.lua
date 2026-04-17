local map = require("mappings.utils").map

map("n", "<C-p>", function()
	require("telescope.builtin").find_files({})
end)
map("n", "<leader>ff", function()
	require("telescope.builtin").find_files({})
end)
map("n", "<leader>lg", function()
	require("telescope.builtin").live_grep({})
end)
