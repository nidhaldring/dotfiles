-- treesitter
require("nvim-treesitter.configs").setup({
  context_commentstring = {
    enable = true,
  },
  ensure_installed = { "c", "lua", "go", "javascript", "typescript" },
  highlight = {
    enable = true,
  },
  -- disable treesitter for large files
  disable = function(_, bufnr)
    return vim.api.nvim_buf_line_count(bufnr) > 50000
  end,
})
