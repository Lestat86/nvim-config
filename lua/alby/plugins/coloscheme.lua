-- -- return {
-- 	{
-- 		"folke/tokyonight.nvim",
-- 		priority = 1000, -- make sure to load this before all the other start plugins
-- 		config = function()
-- 			-- local bg = "#011628"
-- 			-- local bg_dark = "#011423"
-- 			-- local bg_highlight = "#143652"
-- 			-- local bg_search = "#0A64AC"
-- 			-- local bg_visual = "#275378"
-- 			-- local fg = "#CBE0F0"
-- 			-- local fg_dark = "#B4D0E9"
-- 			-- local fg_gutter = "#627E97"
-- 			-- local border = "#547998"
--
-- 			require("tokyonight").setup({
-- 				style = "night",
-- 				transparent = "true",
-- 				-- on_colors = function(colors)
-- 				-- 	colors.bg = bg
-- 				-- 	colors.bg_dark = bg_dark
-- 				-- 	colors.bg_float = bg_dark
-- 				-- 	colors.bg_highlight = bg_highlight
-- 				-- 	colors.bg_popup = bg_dark
-- 				-- 	colors.bg_search = bg_search
-- 				-- 	colors.bg_sidebar = bg_dark
-- 				-- 	colors.bg_statusline = bg_dark
-- 				-- 	colors.bg_visual = bg_visual
-- 				-- 	colors.border = border
-- 				-- 	colors.fg = fg
-- 				-- 	colors.fg_dark = fg_dark
-- 				-- 	colors.fg_float = fg
-- 				-- 	colors.fg_gutter = fg_gutter
-- 				-- 	colors.fg_sidebar = fg_dark
-- 				-- end,
-- 			})
-- 			-- load the colorscheme here
-- 			vim.cmd([[colorscheme tokyonight]])
-- 		end,
-- 	},
-- }
-- return {
-- 	{
-- 		"marko-cerovac/material.nvim",
-- 		priority = 1000, -- make sure to load this before all the other start plugins
-- 		config = function()
-- 			require("material").setup({
-- 				style = "darker",
-- 				transparent = "true",
-- 				-- on_colors = function(colors)
-- 				-- 	colors.bg = bg
-- 				-- 	colors.bg_dark = bg_dark
-- 				-- 	colors.bg_float = bg_dark
-- 				-- 	colors.bg_highlight = bg_highlight
-- 				-- 	colors.bg_popup = bg_dark
-- 				-- 	colors.bg_search = bg_search
-- 				-- 	colors.bg_sidebar = bg_dark
-- 				-- 	colors.bg_statusline = bg_dark
-- 				-- 	colors.bg_visual = bg_visual
-- 				-- 	colors.border = border
-- 				-- 	colors.fg = fg
-- 				-- 	colors.fg_dark = fg_dark
-- 				-- 	colors.fg_float = fg
-- 				-- 	colors.fg_gutter = fg_gutter
-- 				-- 	colors.fg_sidebar = fg_dark
-- 				-- end,
-- 				disable = {
-- 					background = true,
-- 				},
-- 			})
-- 			-- load the colorscheme here
-- 			vim.g.material_style = "darker"
-- 			vim.cmd([[colorscheme material]])
-- 		end,
-- 	},
-- }

-- return {
-- 	"Mofiqul/vscode.nvim",
--
-- 	-- optionally, override the default options:
-- 	config = function()
-- 		local c = require("vscode.colors").get_colors()
-- 		require("vscode").setup({
-- 			-- Alternatively set style in setup
-- 			-- style = 'light'
--
-- 			-- Enable transparent background
-- 			transparent = false,
--
-- 			-- Enable italic comment
-- 			italic_comments = true,
--
-- 			-- Disable nvim-tree background color
-- 			disable_nvimtree_bg = true,
--
-- 			-- Override colors (see ./lua/vscode/colors.lua)
-- 			color_overrides = {
-- 				vscLineNumber = "#FFFFFF",
-- 			},
--
-- 			-- Override highlight groups (see ./lua/vscode/theme.lua)
-- 			group_overrides = {
-- 				-- this supports the same val table as vim.api.nvim_set_hl
-- 				-- use colors from this colorscheme by requiring vscode.colors!
-- 				Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
-- 			},
-- 		})
-- 		require("vscode").load()
-- 	end,
-- }
return {
	"uloco/bluloco.nvim",
	lazy = false,
	priority = 1000,
	dependencies = { "rktjmp/lush.nvim" },
	config = function()
		require("bluloco").setup({
			style = "dark", -- "auto" | "dark" | "light"
			italics = true,
		})

		vim.cmd("colorscheme bluloco")
	end,
}
