-- Unico punto di configurazione di mason (installatore di LSP, formatter, linter)
return {
	"mason-org/mason.nvim",
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		-- serve a mason-tool-installer per tradurre i nomi lspconfig (ts_ls)
		-- nei pacchetti mason (typescript-language-server).
		-- I server li abilita lspconfig.lua con vim.lsp.enable, non mason.
		require("mason-lspconfig").setup({
			automatic_enable = false,
		})

		require("mason-tool-installer").setup({
			ensure_installed = {
				-- lsp servers
				"ts_ls",
				"html",
				"cssls",
				"tailwindcss",
				"svelte",
				"lua_ls",
				"graphql",
				"emmet_ls",
				"prismals",
				"pyright",
				"eslint",
				-- formatters
				"prettier",
				"stylua",
				-- altro
				"tree-sitter-cli", -- richiesta da nvim-treesitter (branch main)
			},
		})
	end,
}
