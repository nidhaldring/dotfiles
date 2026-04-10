return {
  "nvim-telescope/telescope.nvim",
  branch = "master",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build =
      "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    },
  },
  config = function()
    require("telescope").setup({
      pickers = {
        find_files = {
          theme = "dropdown",
          hidden = true,
          find_command = {
            "rg", "--files", "--hidden", "--no-ignore",
            "--glob", "!.git/**",
            "--glob", "!node_modules/**",
            "--glob", "!dist/**",
            "--glob", "!build/**",
            "--glob", "!.nuxt/**",
            "--glob", "!.output/**",
            "--glob", "!__pycache__/**",
            "--glob", "!.venv/**",
          },
        },
        live_grep = {
          layout_config = {
            width = 0.9,
            preview_width = 0.6,
          },
          additional_args = function()
            return {
              "--hidden", "--no-ignore",
              "--glob", "!.git/**",
              "--glob", "!node_modules/**",
              "--glob", "!dist/**",
              "--glob", "!build/**",
              "--glob", "!.nuxt/**",
              "--glob", "!.output/**",
              "--glob", "!__pycache__/**",
              "--glob", "!.venv/**",
            }
          end,
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,              -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case",  -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        },
      },
    })

    require("telescope").load_extension("fzf")
  end,
}
