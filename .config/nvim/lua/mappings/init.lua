local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

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

-- toggle nvim-tree
map("n", "-", ":Oil<CR>")

-- format
map("n", "<leader>fm", vim.lsp.buf.format)
map("v", "<leader>fm", vim.lsp.buf.format)

-- git keybindings
map("n", "<leader>gb", ":Gitsigns blame_line<CR>")

-- folding
map("n", "zR", function()
  require("ufo").openAllFolds()
end)
map("n", "zM", function()
  require("ufo").closeAllFolds()
end)
