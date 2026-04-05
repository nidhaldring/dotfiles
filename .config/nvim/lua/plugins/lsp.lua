require("mason").setup({})
require("mason-lspconfig").setup()
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

vim.diagnostic.config({
  virtual_text = {
    spacing = 4,
    prefix = "●",
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "if_many",
    header = "",
    prefix = "",
  },
})

-- -- Configure diagnostics
-- -- -- Set diagnostic signs
-- local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
-- for type, icon in pairs(signs) do
--   local hl = "DiagnosticSign" .. type
--   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
-- end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "K", function()
      vim.lsp.buf.hover()
    end, opts)
    vim.keymap.set("n", "gd", function()
      vim.lsp.buf.definition()
    end, opts)
    vim.keymap.set("n", "gD", function()
      vim.lsp.buf.declaration()
    end, opts)
    vim.keymap.set("n", "gi", function()
      vim.lsp.buf.implementation()
    end, opts)
    vim.keymap.set("n", "go", function()
      vim.lsp.buf.type_definition()
    end, opts)
    vim.keymap.set("n", "gr", function()
      vim.lsp.buf.references()
    end, opts)
    vim.keymap.set("n", "gs", function()
      vim.lsp.buf.signature_help()
    end, opts)
    vim.keymap.set("n", "gh", function()
      vim.lsp.buf.hover()
    end, opts)
    vim.keymap.set("n", "<leader>rn", function()
      vim.lsp.buf.rename()
      vim.cmd("silent! wa")
    end, opts)
    vim.keymap.set("n", "<leader>ca", function()
      vim.lsp.buf.code_action()
    end, opts)
    vim.keymap.set("n", "[d", function()
      vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR })
    end, opts)
    vim.keymap.set("n", "]d", function()
      vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR })
    end, opts)
    vim.keymap.set("n", "<leader>e", function()
      vim.diagnostic.open_float()
    end, opts)
    vim.keymap.set("n", "gl", function()
      vim.diagnostic.open_float()
    end, opts)
    vim.keymap.set("n", "<leader>q", function()
      vim.diagnostic.setloclist()
    end, opts)
  end,
})

-- vue specific lsp config
-- starts ts_ls when opening a vue file
vim.api.nvim_create_autocmd("FileType", {
  pattern = "vue",
  callback = function(args)
    local root_dir = vim.fs.root(args.buf, { "package.json", "tsconfig.json", "jsconfig.json" })
    vim.lsp.start({
      name = "ts_ls",
      cmd = { "typescript-language-server", "--stdio" },
      root_dir = root_dir,
      init_options = {
        plugins = {
          {
            name = "@vue/typescript-plugin",
            location = vim.fn.stdpath("data")
                .. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
            languages = { "vue" },
          },
        },
      },
      capabilities = require("cmp_nvim_lsp").default_capabilities(),
    })
  end,
})
