return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		-- Mason core
		{ "williamboman/mason.nvim", config = true },
		-- Bridges Mason <-> LSPConfig
		{
			"mason-org/mason-lspconfig.nvim",
			opts = {
				ensure_installed = {
					"pyright",
					"lua_ls",
					"tsserver",
					"svelte",
					"graphql",
					"emmet_ls",
				},
				automatic_enable = true,
			},
			dependencies = {
				"neovim/nvim-lspconfig",
			},
		},
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		-- 1) Import
		local keymap = vim.keymap
		local cmp_cap = require("cmp_nvim_lsp").default_capabilities()

		-- 2) LspAttach for all your keymaps
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }
				keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
				-- …tutti gli altri…
			end,
		})

		-- 3) Set diagnostic signs
		for type, icon in pairs({ Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }) do
			vim.fn.sign_define("DiagnosticSign" .. type, { text = icon, texthl = "DiagnosticSign" .. type })
		end

		vim.diagnostic.config({
			virtual_text = {
				prefix = "●", -- simbolo davanti al messaggio
				spacing = 2, -- spazio tra codice e testo
				-- show = "first",-- opzionale: mostra solo il primo messaggio per linea
			},
			signs = true, -- lascia i segni in gutter
			underline = true, -- mantieni la sottolineatura
			update_in_insert = false, -- non aggiornare durante l’inserimento
			severity_sort = false,
		})

		-- 4) Configure servers via the new vim.lsp.config API
		--    You can also put each block in `after/lsp/<server>.lua`
		vim.lsp.config("pyright", {
			capabilities = cmp_cap,
		})

		vim.lsp.config("lua_ls", {
			capabilities = cmp_cap,
			settings = {
				Lua = {
					diagnostics = { globals = { "vim" } },
					completion = { callSnippet = "Replace" },
				},
			},
		})

		vim.lsp.config("tsserver", { capabilities = cmp_cap })
		vim.lsp.config("svelte", {
			capabilities = cmp_cap,
			on_attach = function(client)
				vim.api.nvim_create_autocmd("BufWritePost", {
					pattern = { "*.js", "*.ts" },
					callback = function(ctx)
						client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
					end,
				})
			end,
		})
		vim.lsp.config("graphql", {
			capabilities = cmp_cap,
			filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
		})
		vim.lsp.config("emmet_ls", {
			capabilities = cmp_cap,
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
		})
	end,
}
