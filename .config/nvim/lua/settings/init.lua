-- map <leader> to space
vim.g.mapleader = " "

vim.opt.relativenumber = true
-- cursor shows current line number instead of 0
vim.opt.number = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.smartindent = true
vim.opt.expandtab = true

vim.opt.wrap = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- use system clipboard
vim.opt.clipboard = "unnamedplus"

vim.opt.termguicolors = true

vim.opt.autoindent = true

vim.opt.undodir = os.getenv("HOME") .. "/.undo/nvim"
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.scrolloff = 8

-- remove status bar cuz we use airline
vim.opt.showmode = false

vim.o.foldcolumn = "0" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.opt.cursorline = true
-- vim.opt.colorcolumn = "100"

vim.opt.splitright = true

-- highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd([[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
augroup END
]])

-- -- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.skip_ts_context_commentstring_module = true


vim.g.c_syntax_for_h = 1
