-- treesitter
require("nvim-treesitter.configs").setup({
	context_commentstring = {
		enable = true,
	},
	ensure_installed = { "c", "lua", "go", "javascript", "typescript" },
	highlight = {
		enable = true,
	},
})

