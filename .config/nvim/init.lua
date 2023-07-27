-- install plugins
require('packer').startup(function(use)
	-- Package manager
	use 'wbthomason/packer.nvim'

	-- tree sitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	-- Theme inspired by Atom
	use "navarasu/onedark.nvim"
	use "RRethy/nvim-base16"

	-- comments and stuff
	use 'tpope/vim-commentary'
	use 'JoosepAlviste/nvim-ts-context-commentstring'

	-- Better status line
	use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons' } }
	use { 'nvim-telescope/telescope.nvim', tag = '0.1.1', requires = { { 'nvim-lua/plenary.nvim' } } }

	-- lsp
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' }, -- Required
			{
				'williamboman/mason.nvim',
				run = function()
					pcall(vim.api.nvim_command, 'MasonUpdate')
				end,
			},
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },  -- Required
			{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
			{ 'L3MON4D3/LuaSnip' },  -- Required
		}
	}

	use 'nvim-tree/nvim-tree.lua'
	use 'nvim-tree/nvim-web-devicons'

	use {
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	}

	use 'crispgm/nvim-tabline'
	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end
	})

	use { 'anuvyklack/pretty-fold.nvim',
		config = function()
			require('pretty-fold').setup()
		end
	}

	use 'nvim-treesitter/nvim-treesitter-context'

	-- use {
	-- 	"SmiteshP/nvim-navic",
	-- 	requires = "neovim/nvim-lspconfig"
	-- }
end)


vim.opt.relativenumber = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.wrap = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.clipboard = 'unnamedplus'
vim.opt.termguicolors = true
vim.opt.autoindent = true
vim.opt.mouse = "n" -- disable mouse
vim.g.mapleader = " "


-- keybindings
vim.keymap.set("n", "{", "{zz")
vim.keymap.set("n", "}", "}zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")


-- telescrop keybindings
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>lg", builtin.live_grep, {})

-- nerdtree keybindings
local function my_on_attach(bufnr)
	local api = require "nvim-tree.api"
	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end
	-- default mappings
	api.config.mappings.default_on_attach(bufnr)
	-- custom mappings
	vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
	vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
end
-- pass to setup along with your other options
require("nvim-tree").setup {
	---
	on_attach = my_on_attach,
	---
}
vim.keymap.set("n", "<leader>ft", ":NvimTreeToggle<CR>", { silent = true })



-- treesitter
require 'nvim-treesitter.configs'.setup {
	context_commentstring = {
		enable = true
	}
}

require('tabline').setup({
	show_index = true,      -- show tab index
	show_modify = true,     -- show buffer modification indicator
	show_icon = true,       -- show file extension icon
	modify_indicator = '*', -- modify indicator
	no_name = 'untitled',   -- no name buffer name
	brackets = { '[', ']' }, -- file name brackets surrounding
})
vim.keymap.set("n", "<tab>", ":tabnext<CR>", { silent = true })
vim.keymap.set("n", "<C-n>", ":tabnew<CR>", { silent = true })


-- lsp config
local lsp = require('lsp-zero').preset({})
lsp.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp.default_keymaps({ buffer = bufnr })
	vim.keymap.set("n", "gh", function() vim.lsp.buf.hover() end, { buffer = bufnr, remap = false })
	vim.keymap.set("n", "<leader>;", "<cmd> lua vim.diagnostic.open_float()<CR>", { buffer = bufnr, remap = false })
end)
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]


-- autocompletion keybindings
-- You need to setup `cmp` after lsp-zero
local cmp = require('cmp')
cmp.setup({
	mapping = {
		-- `Enter` key to confirm completion
		['<CR>'] = cmp.mapping.confirm({ select = false }),
	}
})
lsp.setup()


-- theme
require("onedark").load()

-- lualine
require('lualine').setup()

-- highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd [[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
augroup END
]]

require 'treesitter-context'.setup {
	enable = true,           -- Enable this plugin (Can be enabled/disabled later via commands)
	max_lines = 0,           -- How many lines the window should span. Values <= 0 mean no limit.
	min_window_height = 0,   -- Minimum editor window height to enable context. Values <= 0 mean no limit.
	line_numbers = true,
	multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
	trim_scope = 'outer',    -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
	mode = 'cursor',         -- Line used to calculate context. Choices: 'cursor', 'topline'
	-- Separator between context and content. Should be a single character string, like '-'.
	-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
	separator = nil,
	zindex = 20,    -- The Z-index of the context window
	on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
}

-- local navic = require("nvim-navic")
-- require("lspconfig").clangd.setup {
-- 	on_attach = function(client, bufnr)
-- 		navic.attach(client, bufnr)
-- 	end
-- }
