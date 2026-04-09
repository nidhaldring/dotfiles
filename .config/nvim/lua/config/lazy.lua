-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- -- Setup lazy.nvim
-- require("lazy").setup({
-- 	spec = {
-- 		-- import your plugins
-- 		-- { import = "plugins" },
-- 	},
-- 	-- Configure any other settings here. See the documentation for more details.
-- 	-- colorscheme that will be used when installing plugins.
-- 	-- install = { colorscheme = { "habamax" } },
-- 	-- -- automatically check for plugin updates
-- 	-- checker = { enabled = true },
-- })

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- treesitter
		{
			"nvim-treesitter/nvim-treesitter",
			lazy = false,
			build = ":TSUpdate",
			branch = "master",
			-- main = "nvim-treesitter.configs", -- Sets main module to use for opts
			config = function()
				require("nvim-treesitter").setup()
				require("nvim-treesitter.configs").setup({
					ensure_installed = { "c", "lua", "javascript", "typescript", "go" },
					highlight = {
						enable = true,
						disable = function(_, bufnr)
							return vim.api.nvim_buf_line_count(bufnr) > 50000
						end,
					},
				})
			end,
		},

		-- fidget
		"j-hui/fidget.nvim",

		-- colorscheme
		"navarasu/onedark.nvim",

		-- comments
		"tpope/vim-commentary",
		{
			"JoosepAlviste/nvim-ts-context-commentstring",
			config = function()
				require("ts_context_commentstring").setup({})
			end,
		},

		-- status line
		{
			"nvim-lualine/lualine.nvim",
			dependencies = { "kyazdani42/nvim-web-devicons" },
		},

		-- telescope
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		},
		{
			"nvim-telescope/telescope.nvim",
			branch = "master",
			dependencies = { "nvim-lua/plenary.nvim" },
		},

		-- lsp
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",

		-- completion
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"L3MON4D3/LuaSnip",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",

		-- project management
		{
			"ahmedkhalf/project.nvim",
			config = function()
				require("project_nvim").setup({})
			end,
		},

		-- surround
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

		-- folds
		{
			"kevinhwang91/nvim-ufo",
			dependencies = "kevinhwang91/promise-async",
		},

		-- file explorer
		"stevearc/oil.nvim",

		-- autopairs
		"windwp/nvim-autopairs",

		-- prisma syntax
		"prisma/vim-prisma",

		-- indent guides
		"lukas-reineke/indent-blankline.nvim",

		-- null-ls / none-ls
		"nvimtools/none-ls.nvim",
		"nvimtools/none-ls-extras.nvim",

		-- autotag
		"windwp/nvim-ts-autotag",

		-- dadbod (database)
		{
			"kristijanhusak/vim-dadbod-ui",
			dependencies = {
				"tpope/vim-dadbod",
				{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "postgresql" } },
			},
		},

		-- lazydev (lua dev)
		"folke/lazydev.nvim",

		-- sync terminal bg with colorscheme
		"typicode/bg.nvim",
	},
})
