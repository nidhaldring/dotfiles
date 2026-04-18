return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	branch = "main",
	config = function()
		require("nvim-treesitter").install({
			"c",
			"lua",
			"javascript",
			"typescript",
			"go",
			"rust",
			"vue",
			"html",
			"yaml",
			"json",
			"markdown",
      "markdown_inline"
		})

		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				if vim.api.nvim_buf_line_count(args.buf) > 50000 then
					return
				end
				-- if we couldn't find a parser for filetype ignore parsing
				if not pcall(vim.treesitter.start, args.buf) then
					return
				end
				vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
