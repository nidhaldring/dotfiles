require("packer").startup(function(use)
	-- Package manager
	use("wbthomason/packer.nvim")

	-- tree sitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	use("navarasu/onedark.nvim")
	-- use("folke/tokyonight.nvim")

	-- comments and stuff
	use("tpope/vim-commentary")
	-- used to change commentstring depending on cursor placement (useful when working with vuejs etc ...)
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- Better status line
	use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })

	-- Telescope
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	})
	use({ "nvim-telescope/telescope.nvim", tag = "0.1.8", requires = { { "nvim-lua/plenary.nvim" } } })

	-- lsp
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{
				"williamboman/mason.nvim",
				run = function()
					pcall(vim.api.nvim_command, "MasonUpdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "L3MON4D3/LuaSnip" }, -- Required
			{ "hrsh7th/cmp-nvim-lua" },
		},
	})

	use({
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup({})
		end,
	})

	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({})
		end,
	})

	use("lewis6991/gitsigns.nvim")

	use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })

	use("stevearc/oil.nvim")

	use("windwp/nvim-autopairs")

	use("prisma/vim-prisma")

	use("lukas-reineke/indent-blankline.nvim")

	use("nvimtools/none-ls.nvim")

	use("folke/neodev.nvim")

	use("tpope/vim-fugitive")

	use("windwp/nvim-ts-autotag")

	use({
		"kristijanhusak/vim-dadbod-ui",
		requires = {
			"tpope/vim-dadbod",
			{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "postgresql" } },
		},
	})

	use({ "typicode/bg.nvim" }) -- sync terminal bg with colorscheme i'm currently using
end)
