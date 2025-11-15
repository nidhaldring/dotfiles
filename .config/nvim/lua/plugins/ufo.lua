-- UFO folding setup
-- Note: LSP capabilities for folding are now handled in lsp.lua
-- This avoids duplicate LSP setups and the deprecated lspconfig API

require('ufo').setup({
    provider_selector = function(bufnr, filetype, buftype)
        return {'treesitter', 'indent'}
    end
})

-- Add keymaps for folding
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
