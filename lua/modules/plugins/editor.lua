local editor = {}

editor["rainbowhxch/accelerated-jk.nvim"] = {
	lazy = true,
	event = "VeryLazy",
	config = require("editor.accelerated-jk"),
}

editor["ggandor/leap.nvim"] = {
	lazy = true,
	event = "VeryLazy",
	config = require("editor.leap"),
}

editor["numToStr/Comment.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("editor.comment"),
}

editor["windwp/nvim-autopairs"] = {
	lazy = true,
	event = "InsertEnter",
	config = require("editor.autopairs"),
}
----------------------------------------------------------------------
--                  :treesitter related plugins                    --
----------------------------------------------------------------------
editor["nvim-treesitter/nvim-treesitter"] = {
	lazy = true,
	build = function()
		if #vim.api.nvim_list_uis() ~= 0 then
			vim.api.nvim_command("TSUpdate")
		end
	end,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("editor.treesitter"),
	dependencies = {
		{ "nvim-treesitter/nvim-treesitter-textobjects" },
		{ "mrjones2014/nvim-ts-rainbow" },
		{ "JoosepAlviste/nvim-ts-context-commentstring" },
		{ "mfussenegger/nvim-treehopper" },
		{ "andymass/vim-matchup" },
		{
			"NvChad/nvim-colorizer.lua",
			config = require("editor.colorizer"),
		},
	},
}
return editor
