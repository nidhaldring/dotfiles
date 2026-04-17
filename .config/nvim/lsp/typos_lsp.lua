-- Currently i need to include all config from nvim-lspconfig
-- waiting for issue (https://github.com/neovim/neovim/pull/38007) to be solved
return {
	init_options = {
		diagnosticSeverity = "Warning",
	},
	cmd = { "typos-lsp" },
	root_markers = { "typos.toml", "_typos.toml", ".typos.toml", "pyproject.toml", "Cargo.toml" },
	settings = {},
}
