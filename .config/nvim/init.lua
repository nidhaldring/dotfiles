local install_plugins = false
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
  use 'joshdick/onedark.vim'

	-- icons 
	use 'kyazdani42/nvim-web-devicons'


	-- comments and stuff 
	use 'tpope/vim-commentary'
	use 'JoosepAlviste/nvim-ts-context-commentstring'

	-- Better status line
	use {'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons'}}
	use {	'nvim-telescope/telescope.nvim', tag = '0.1.1',requires = { {'nvim-lua/plenary.nvim'} }}

	if install_plugins then
		require('packer').sync()
	end
end)


vim.opt.relativenumber = true
vim.opt.hlsearch = false
vim.opt.wrap = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.clipboard = 'unnamedplus'
vim.opt.termguicolors = true
vim.opt.autoindent = true
vim.cmd('colorscheme onedark')



require('lualine').setup()
require'nvim-treesitter.configs'.setup {
  context_commentstring = {
    enable = true
  }
}
