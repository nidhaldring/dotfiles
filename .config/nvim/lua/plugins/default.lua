return {
	{
		"j-hui/fidget.nvim",
		opts = {},
	},
	{
		"tpope/vim-commentary",
		event = "VeryLazy",
	},
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		config = function()
			require("ts_context_commentstring").setup({ enable_autocmd = false })
			local get_option = vim.filetype.get_option
			vim.filetype.get_option = function(filetype, option)
				return option == "commentstring"
						and require("ts_context_commentstring.internal").calculate_commentstring()
					or get_option(filetype, option)
			end
		end,
	},

	{
		"kylechui/nvim-surround",
		version = "*",
		config = function()
			require("nvim-surround").setup({})
		end,
	},

	-- git
	"lewis6991/gitsigns.nvim",
	"tpope/vim-fugitive",

	-- autotag
	{
		"windwp/nvim-ts-autotag",
		opts = {},
	},

	-- dadbod (database)
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = {
			"tpope/vim-dadbod",
			{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "postgresql" } },
		},
	},

	"prisma/vim-prisma",

	-- lazydev (lua dev)
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},

	-- sync terminal bg with colorscheme
	"typicode/bg.nvim",
}
