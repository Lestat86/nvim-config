-- Commenti: si usa il commento nativo di nvim (gc / gcc / gc{movimento}).
-- Questo plugin sceglie la sintassi giusta in base al punto del file
-- (es. `{/* */}` dentro JSX, `<!-- -->` nell'html di uno .svelte).
return {
	"JoosepAlviste/nvim-ts-context-commentstring",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		enable_autocmd = false,
	},
	init = function()
		vim.g.skip_ts_context_commentstring_module = true
	end,
	config = function(_, opts)
		require("ts_context_commentstring").setup(opts)

		-- integrazione con il commento nativo (gc)
		local get_option = vim.filetype.get_option
		---@diagnostic disable-next-line: duplicate-set-field
		vim.filetype.get_option = function(filetype, option)
			return option == "commentstring"
					and require("ts_context_commentstring.internal").calculate_commentstring()
				or get_option(filetype, option)
		end
	end,
}
