return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "kyazdani42/nvim-web-devicons" },
  opts = {
    options = {
      theme = "onedark",
    },
    sections = {
      lualine_c = {
        { "filename", path = 1 },
      },
    },
  },
}
