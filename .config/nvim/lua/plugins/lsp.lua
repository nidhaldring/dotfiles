return {
  {
    "neovim/nvim-lspconfig",
    -- opts = {}
  },
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {},
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
          { name = "buffer",  keyword_length = 3 },
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
