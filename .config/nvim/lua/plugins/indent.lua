return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",

	config = function()
		-- Set indent guide color to subtle grey
		local hooks = require("ibl.hooks")
		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(0, "IblIndent", { fg = "#3b4048" })
			vim.api.nvim_set_hl(0, "IblScope", { fg = "#545862" })
		end)

		require("ibl").setup({
			indent = {
				char = "▏",
			},
			scope = {
				enabled = true,
				show_start = false,
				show_end = false,
			},
		})
	end,
}
