local ui = {}

ui["catppuccin/nvim"] = {
	lazy = true,
	event = { "ColorScheme" },
	name = "catppuccin",
	config = require("ui.themes.catppuccin"),
}

ui["sainnhe/edge"] = {
	lazy = true,
	event = { "ColorScheme" },
	config = require("ui.themes.edge"),
}

ui["shaunsingh/nord.nvim"] = {
	lazy = true,
	event = { "ColorScheme" },
	config = require("ui.themes.nord"),
}

ui["folke/tokyonight.nvim"] = {
	lazy = true,
	event = { "ColorScheme" },
	config = require("ui.themes.tokyonight"),
}

ui["olimorris/onedarkpro.nvim"] = {
	lazy = true,
	event = { "ColorScheme" },
	config = require("ui.themes.onedarkpro"),
}

ui["akinsho/bufferline.nvim"] = {
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("ui.bufferline"),
}

ui["nvim-lualine/lualine.nvim"] = {
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("ui.lualine"),
}

ui["lewis6991/gitsigns.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("ui.gitsigns"),
}

ui["lukas-reineke/indent-blankline.nvim"] = {
	lazy = true,
	event = "BufReadPost",
	config = require("ui.indent-blankline"),
}

-- ui["folke/noice.nvim"] = {
-- 	lazy = true,
-- 	event = "VeryLazy",
-- 	dependencies = {
-- 		{ "MunifTanjim/nui.nvim" },
-- 		{
-- 			"rcarriga/nvim-notify",
-- 			-- config = require("ui.notify")
-- 		},
-- 	},
-- 	config = require("ui.noice"),
-- }

return ui
