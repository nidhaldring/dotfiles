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

-- vue specific lsp config
-- starts ts_ls when opening a vue file
vim.api.nvim_create_autocmd("FileType", {
	pattern = "vue",
	callback = function(args)
		local root_dir = vim.fs.root(args.buf, { "package.json", "tsconfig.json", "jsconfig.json" })
		vim.lsp.start({
			name = "ts_ls",
			cmd = { "typescript-language-server", "--stdio" },
			root_dir = root_dir,
			init_options = {
				plugins = {
					{
						name = "@vue/typescript-plugin",
						location = vim.fn.stdpath("data")
							.. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
						languages = { "vue" },
					},
				},
			},
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
		})
	end,
})


