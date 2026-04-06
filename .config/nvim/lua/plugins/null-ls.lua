local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.prettierd,
    -- require("none-ls.diagnostics.eslint"),
    require("none-ls.code_actions.eslint"),
    -- null_ls.builtins.diagnostics.codespell.with({
    --   -- this forces codespell to run in all filetypes
    --   filetypes = {},
    -- }),
  },
})
