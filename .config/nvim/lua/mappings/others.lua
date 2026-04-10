local map = require("mappings.utils").map

-- toggle nvim-tree
map("n", "-", ":Oil<CR>")

-- git keybindings
map("n", "<leader>gb", ":Gitsigns blame_line<CR>")
