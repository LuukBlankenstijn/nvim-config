return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = { "intelephense", "ts_ls" },
			})

			-- Configure LSP servers
			local lspconfig = require("lspconfig")

			lspconfig.intelephense.setup({
				on_attach = function(client, bufnr)
					-- Key mappings for LSP features
					local opts = { noremap = true, silent = true, buffer = bufnr }
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, opts)
				end,
				settings = {
					intelephense = {
						files = {
							maxSize = 5000000, -- Increase max file size (optional)
						},
					},
				},
			})

			lspconfig.ts_ls.setup({})
		end,
	},
}
