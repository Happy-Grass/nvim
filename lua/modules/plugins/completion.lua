local completion = {}

completion["neovim/nvim-lspconfig"] = {
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("completion.setup.lspconfig"),
	dependencies = {
		{ "ray-x/lsp_signature.nvim" },
		{ "williamboman/mason.nvim", config = require("completion.setup.installer") },
		{ "williamboman/mason-lspconfig.nvim" },
		{
			"glepnir/lspsaga.nvim",
			config = require("completion.lspsaga"),
		},
	},
}
completion["jose-elias-alvarez/null-ls.nvim"] = {
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("completion.null-ls"),
	dependencies = {
		"nvim-lua/plenary.nvim",
		"jay-babu/mason-null-ls.nvim",
	},
}
completion["hrsh7th/nvim-cmp"] = {
	lazy = true,
	event = { "InsertEnter", "CmdlineEnter" },
	config = require("completion.cmp"),
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			dependencies = { "rafamadriz/friendly-snippets" },
			config = require("completion.luasnip"),
		},
		{ "onsails/lspkind.nvim" },
		-- { "lukas-reineke/cmp-under-comparator" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ "hrsh7th/cmp-nvim-lsp" },
		-- { "hrsh7th/cmp-nvim-lua" },
		-- { "andersevenrud/cmp-tmux" },
		{ "hrsh7th/cmp-path" },
		-- { "f3fora/cmp-spell" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-cmdline" },
		{ "kdheepak/cmp-latex-symbols" },
		{ "nvim-telescope/telescope.nvim" }, -- ui for luasnip select
		-- { "ray-x/cmp-treesitter" },
		{ "tzachar/cmp-tabnine", build = "./install.sh", config = require("completion.tabnine") },
	},
}

return completion
