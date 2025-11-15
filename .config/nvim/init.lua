-- install plugins
require("plugin-manager")
require("settings")
require("plugins")
require("mappings")

-- Force comment colors to grey after everything loads
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "Comment", { fg = "#3e4451", italic = true })
    vim.api.nvim_set_hl(0, "@comment", { fg = "#3e4451", italic = true })
  end,
})

-- Apply immediately
vim.api.nvim_set_hl(0, "Comment", { fg = "#3e4451", italic = true })
vim.api.nvim_set_hl(0, "@comment", { fg = "#3e4451", italic = true })
