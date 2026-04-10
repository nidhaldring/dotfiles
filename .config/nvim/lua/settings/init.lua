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
-- vim.opt.cursorline = true
-- vim.opt.colorcolumn = "100"

vim.opt.splitright = true

-- highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd([[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
augroup END
]])

vim.g.skip_ts_context_commentstring_module = true

vim.g.c_syntax_for_h = 1
vim.opt.signcolumn = "yes:1" -- merge signs in 1 col
vim.opt.numberwidth = 2 -- max width for numbers in number col

vim.diagnostic.config({
	virtual_text = {
		spacing = 4,
		prefix = "●",
	},
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = "if_many",
		header = "",
		prefix = "",
	},
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover()
		end, opts)
		vim.keymap.set("n", "gd", function()
			vim.lsp.buf.definition()
		end, opts)
		vim.keymap.set("n", "gD", function()
			vim.lsp.buf.declaration()
		end, opts)
		vim.keymap.set("n", "gi", function()
			vim.lsp.buf.implementation()
		end, opts)
		vim.keymap.set("n", "go", function()
			vim.lsp.buf.type_definition()
		end, opts)
		vim.keymap.set("n", "gr", function()
			vim.lsp.buf.references()
		end, opts)
		vim.keymap.set("n", "gs", function()
			vim.lsp.buf.signature_help()
		end, opts)
		vim.keymap.set("n", "gh", function()
			vim.lsp.buf.hover()
		end, opts)
		vim.keymap.set("n", "<leader>rn", function()
			vim.lsp.buf.rename()
			vim.cmd("silent! wa")
		end, opts)
		vim.keymap.set("n", "<leader>ca", function()
			vim.lsp.buf.code_action()
		end, opts)
		vim.keymap.set("n", "[d", function()
			vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR })
		end, opts)
		vim.keymap.set("n", "]d", function()
			vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR })
		end, opts)
		vim.keymap.set("n", "<leader>e", function()
			vim.diagnostic.open_float()
		end, opts)
		vim.keymap.set("n", "gl", function()
			vim.diagnostic.open_float()
		end, opts)
		vim.keymap.set("n", "<leader>q", function()
			vim.diagnostic.setloclist()
		end, opts)
	end,
})
