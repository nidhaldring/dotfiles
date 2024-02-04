-- lsp config
local lsp = require("lsp-zero").preset({})
lsp.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp.default_keymaps({ buffer = bufnr })
	vim.keymap.set("n", "gh", function()
		vim.lsp.buf.hover()
	end, { buffer = bufnr, remap = false })

	vim.keymap.set("n", "<leader>rn", function()
		vim.lsp.buf.rename()
	end, { buffer = bufnr, remap = false })

	vim.keymap.set("n", "<leader>ca", function()
		vim.lsp.buf.code_action()
	end, { buffer = bufnr, remap = false })

	vim.keymap.set("n", "<leader>rf", function()
		vim.lsp.buf.references()
	end, { buffer = bufnr, remap = false })
end)
-- vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]

-- autocompletion keybindings
-- You need to setup `cmp` after lsp-zero
local cmp = require("cmp")
cmp.setup({
	mapping = {
		-- `Enter` key to confirm completion
		["<CR>"] = cmp.mapping.confirm({ select = false }),
	},
	completion = { completeopt = "menu,menuone,noinsert" },
})
lsp.setup()
