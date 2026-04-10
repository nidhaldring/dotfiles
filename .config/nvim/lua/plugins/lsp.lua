-- -- vue specific lsp config
-- -- starts ts_ls when opening a vue file
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "vue",
--   callback = function(args)
--     local root_dir = vim.fs.root(args.buf, { "package.json", "tsconfig.json", "jsconfig.json" })
--     vim.lsp.start({
--       name = "ts_ls",
--       cmd = { "typescript-language-server", "--stdio" },
--       root_dir = root_dir,
--       init_options = {
--         plugins = {
--           {
--             name = "@vue/typescript-plugin",
--             location = vim.fn.stdpath("data")
--                 .. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
--             languages = { "vue" },
--           },
--         },
--       },
--       capabilities = require("cmp_nvim_lsp").default_capabilities(),
--     })
--   end,
-- })

return {
  {
    "neovim/nvim-lspconfig",
    -- opts = {}
  },
  {
    "williamboman/mason.nvim",
    opts = {}
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {}
  },
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				sources = {
					{ name = "nvim_lsp" },
					{ name = "path" },
					{ name = "buffer", keyword_length = 3 },
				},
				mapping = cmp.mapping.preset.insert({
					-- select = true, forces enter to only complete if something is explicityl selected
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					-- this bloew forces completion menu to appear,
					-- not sure if this is useful or no, but i'll keep it for now
					["<C-Space>"] = cmp.mapping.complete(),
				}),
				completion = { completeopt = "menu,menuone,noinsert" },
			})

			cmp.setup.filetype({ "sql" }, {
				sources = {
					{ name = "buffer" },
					{ name = "vim-dadbod-completion" },
				},
			})
		end,
	},
}
