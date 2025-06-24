return {
	"norcalli/nvim-colorizer.lua",
	ft = { "css", "scss", "html", "javascript", "typescript", "lua", "json", "yaml" },
	opts = {
		-- attiva tutti i formati esadecimali (#RGB, #RRGGBB, #AARRGGBB)
		RGB = true, -- #RGB e #RRGGBB
		RRGGBB = true, -- #RRGGBB
		AARRGGBB = true, -- #AARRGGBB
		-- opzioni extra
		names = false, -- nomi CSS (es. “red”)
		tailwind = false, -- classi Tailwind
		mode = "background", -- evidenzia via background
	},
	config = function(_, opts)
		require("colorizer").setup(opts.ft, opts)
	end,
}
