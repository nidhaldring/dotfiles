local map = require("mappings.utils").map

-- disable space in normal mode
map("n", "<leader>", "<nop>")

-- actual delete
map("n", "<leader>d", '"_d')
map("v", "<leader>d", '"_d')
map("n", "c", '"_c')
map("v", "c", '"_c')
map("n", "C", '"_C')
map("v", "C", '"_C')

-- switch between two recent buffers
map("n", "<leader><leader>", "<c-^>")
