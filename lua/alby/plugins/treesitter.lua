-- nvim-treesitter (branch `main`): installa i parser e le query.
-- Evidenziazione e selezione incrementale ora sono funzioni native di nvim;
-- qui le attiviamo per ogni filetype che ha un parser.
-- Nota: il branch `main` non supporta il lazy-loading e richiede la CLI
-- `tree-sitter` (installata via mason, vedi lsp/mason.lua).
return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").install({
			"json",
			"javascript",
			"typescript",
			"tsx",
			"yaml",
			"html",
			"css",
			"prisma",
			"markdown",
			"markdown_inline",
			"svelte",
			"graphql",
			"bash",
			"lua",
			"vim",
			"dockerfile",
			"gitignore",
			"query",
			"vimdoc",
			"c",
			"python",
		})

		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("alby_treesitter", { clear = true }),
			callback = function(args)
				-- evidenziazione (se esiste un parser per questo filetype)
				if not pcall(vim.treesitter.start, args.buf) then
					return
				end
				-- indentazione basata su treesitter
				vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})

		-- Selezione incrementale (stessi tasti di prima):
		-- <C-space> da normal avvia la selezione sul nodo sotto il cursore,
		-- in visual la allarga al nodo padre; <BS> la restringe.
		-- In visual funzionano anche i tasti nativi: an / in / ]n / [n
		vim.keymap.set({ "n", "x" }, "<C-space>", function()
			vim.treesitter.select("parent", vim.v.count1)
		end, { desc = "Expand selection (treesitter)" })
		vim.keymap.set("x", "<BS>", function()
			vim.treesitter.select("child", vim.v.count1)
		end, { desc = "Shrink selection (treesitter)" })
	end,
}
