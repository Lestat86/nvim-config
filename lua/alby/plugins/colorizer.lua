-- Colora i codici colore con il colore che rappresentano.
-- catgoose/nvim-colorizer.lua è il fork mantenuto dell'originale di norcalli.
local filetypes = { "css", "scss", "html", "javascript", "typescript", "lua", "json", "yaml" }

return {
	"catgoose/nvim-colorizer.lua",
	ft = filetypes,
	opts = {
		filetypes = filetypes,
		options = {
			parsers = {
				names = { enable = false }, -- nomi CSS (es. "red")
				hex = {
					rgb = true, -- #RGB
					rrggbb = true, -- #RRGGBB
					hash_aarrggbb = true, -- #AARRGGBB
				},
				tailwind = { enable = false }, -- classi Tailwind
			},
			display = {
				mode = "background", -- evidenzia via background
			},
		},
	},
}
