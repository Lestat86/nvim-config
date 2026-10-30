return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				svelte = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				liquid = { "prettier" },
				lua = { "stylua" },
			},
			format_on_save = function(bufnr)
				-- JS/TS files are formatted by ESLint LSP via LspEslintFixAll (see lspconfig.lua)
				local ft = vim.bo[bufnr].filetype
				if ft == "javascript" or ft == "typescript" or ft == "javascriptreact" or ft == "typescriptreact" then
					return false
				end
				return {
					lsp_format = "fallback",
					async = false,
					timeout_ms = 1000,
				}
			end,
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_format = "fallback",
				async = true,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
