return {
  {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvimtools/none-ls-extras.nvim" },
    opts = function()
      local null_ls = require("null-ls")
      return {
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
      }
    end,
  },
}
