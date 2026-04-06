-- telescope configs
require("telescope").setup({
  defaults = {
    file_ignore_patterns = {
      "node_modules/",
      "%.git/",
      "%.nuxt/",
      "%.output/",
      "__pycache__/",
      "%.venv/",
      "dist/",
      "build/",
    },
  },
  pickers = {
    find_files = {
      theme = "dropdown",
      hidden = true,
      no_ignore = true,
    },
    live_grep = {
      layout_config = {
        width = 0.9,
        preview_width = 0.6,
      },
      additional_args = function(opts)
        return { "--hidden", "--no-ignore" }
      end,
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,                -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case",    -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
  },
})
require("telescope").load_extension("fzf")
