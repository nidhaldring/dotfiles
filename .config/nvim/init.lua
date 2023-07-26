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

-- comments and stuff 
use 'tpope/vim-commentary'
use 'JoosepAlviste/nvim-ts-context-commentstring'

-- Better status line
use {'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons'}}
use {	'nvim-telescope/telescope.nvim', tag = '0.1.1',requires = { {'nvim-lua/plenary.nvim'} }}

-- lsp
use {
	'VonHeikemen/lsp-zero.nvim',
	branch = 'v2.x',
	requires = {
		-- LSP Support
		{'neovim/nvim-lspconfig'},             -- Required
		{
		'williamboman/mason.nvim',
		run = function()
			pcall(vim.api.nvim_command, 'MasonUpdate')
		end,
	},
	{'williamboman/mason-lspconfig.nvim'}, -- Optional

		-- Autocompletion
		{'hrsh7th/nvim-cmp'},     -- Required
		{'hrsh7th/cmp-nvim-lsp'}, -- Required
		{'L3MON4D3/LuaSnip'},     -- Required
	}
}

use 'nvim-tree/nvim-tree.lua'
use 'nvim-tree/nvim-web-devicons'

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
vim.opt.mouse="" -- disable mouse
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
vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
end
-- pass to setup along with your other options
require("nvim-tree").setup {
---
on_attach = my_on_attach,
---
}

-- nvim-tree
require("nvim-tree").setup()

-- lualine
require('lualine').setup()


-- treesitter
require'nvim-treesitter.configs'.setup {
context_commentstring = {
	enable = true
}
}


-- lsp config
local lsp = require('lsp-zero').preset({})
lsp.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp.default_keymaps({buffer = bufnr})
	vim.keymap.set("n", "gh", function () vim.lsp.buf.hover()	end, {buffer = bufnr, remap = false })
	vim.keymap.set("n", "<leader>;", "<cmd> lua vim.diagnostic.open_float()<CR>", {buffer = bufnr, remap = false })
end)


-- autocompletion keybindings
-- You need to setup `cmp` after lsp-zero
local cmp = require('cmp')
cmp.setup({
  mapping = {
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({select = false}),
  }
})
lsp.setup()


-- theme
require("onedark").load()
