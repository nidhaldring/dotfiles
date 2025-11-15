-- lsp config
local lsp_zero = require("lsp-zero")

-- Configure diagnostics
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
		source = "always",
		header = "",
		prefix = "",
	},
})

-- Set diagnostic signs
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- lsp_attach is where you enable features that only work
-- if there is a language server active in the file
local lsp_attach = function(client, bufnr)
	local opts = { buffer = bufnr }

	vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
	vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
	vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
	vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
	vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
	vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
	vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
	vim.keymap.set("n", "gh", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)

	vim.keymap.set("n", "<leader>rn", function()
		vim.lsp.buf.rename()
		vim.cmd("silent! wa")
	end, opts)

	vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)

	-- Diagnostic keymaps
	vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
	vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
	vim.keymap.set("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
	vim.keymap.set("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<cr>", opts)
end

lsp_zero.extend_lspconfig({
	sign_text = true,
	lsp_attach = lsp_attach,
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

-- Setup mason for LSP server installation
require("mason").setup({})
require("mason-lspconfig").setup({
	handlers = {
		-- this first function is the "default handler"
		-- it applies to every language server without a "custom handler"
		function(server_name)
			require("lspconfig")[server_name].setup({})
		end,
	},
})

-- autocompletion keybindings
-- You need to setup `cmp` after lsp-zero
local cmp = require("cmp")
local cmp_action = lsp_zero.cmp_action()

cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "path" },
		{ name = "buffer", keyword_length = 3 },
	},
	mapping = cmp.mapping.preset.insert({
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-f>"] = cmp_action.luasnip_jump_forward(),
		["<C-b>"] = cmp_action.luasnip_jump_backward(),
	}),
	completion = { completeopt = "menu,menuone,noinsert" },
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
})

cmp.setup.filetype({ "sql" }, {
	sources = {
		{ name = "buffer" },
		{ name = "vim-dadbod-completion" },
	},
})

vim.filetype.add({ extension = { templ = "templ" } })
