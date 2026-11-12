-- Fa conoscere a lua_ls le API di nvim e dei plugin (sostituisce neodev.nvim)
return {
	"folke/lazydev.nvim",
	ft = "lua",
	opts = {
		library = {
			{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
		},
	},
}
