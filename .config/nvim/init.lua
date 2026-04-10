-- disable netrw before any plugins load (must be set early)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- install plugins
require("config.lazy")
require("settings")
require("mappings")
