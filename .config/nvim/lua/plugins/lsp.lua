-- lsp config
local lsp = require("lsp-zero").preset({})
function on_attach(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp.default_keymaps({ buffer = bufnr })
	vim.keymap.set("n", "gh", function()
		vim.lsp.buf.hover()
	end, { buffer = bufnr, remap = false })

	vim.keymap.set("n", "<leader>rn", function()
		vim.lsp.buf.rename()
		vim.cmd("silent! wa")
	end, { buffer = bufnr, remap = false })

	vim.keymap.set("n", "<leader>ca", function()
		vim.lsp.buf.code_action()
	end, { buffer = bufnr, remap = false })
end

lsp.on_attach(on_attach)

-- autocompletion keybindings
-- You need to setup `cmp` after lsp-zero
local cmp = require("cmp")
cmp.setup({
	mapping = {
		["<CR>"] = cmp.mapping.confirm({ select = false }),
	},
	completion = { completeopt = "menu,menuone,noinsert" },
})

cmp.setup.filetype({ "sql" }, {
	sources = {
		{ name = "buffer" },
		{ name = "vim-dadbod-completion" },
	},
})

vim.filetype.add({ extension = { templ = "templ" } })

lsp.setup()
