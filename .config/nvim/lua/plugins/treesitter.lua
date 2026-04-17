return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	branch = "master",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			highlight = {
				ensure_installed = {
					"c",
					"lua",
					"javascript",
					"typescript",
					"go",
					"rust",
					"vue",
					"markdown",
					"html",
					"latex",
					"yaml",
					"json",
				},
				enable = true,
				disable = function(_, bufnr)
					return vim.api.nvim_buf_line_count(bufnr) > 50000
				end,
			},
		})
	end,
}
