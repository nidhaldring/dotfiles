return {
  {
    "j-hui/fidget.nvim",
    opts = {},
  },
  {
    "tpope/vim-commentary",
    lazy = false,
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    config = function()
      require("ts_context_commentstring").setup({})
    end,
  },

  {
    "kylechui/nvim-surround",
    version = "*",
    config = function()
      require("nvim-surround").setup({})
    end,
  },

  -- git
  "lewis6991/gitsigns.nvim",
  "tpope/vim-fugitive",

  -- autotag
  {
    "windwp/nvim-ts-autotag",
    opts = {},
  },

  -- dadbod (database)
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      "tpope/vim-dadbod",
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "postgresql" } },
    },
  },

  {
    "prisma/vim-prisma",
    config = function() end,
  },

  -- lazydev (lua dev)
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },

  -- sync terminal bg with colorscheme
  "typicode/bg.nvim",
}
