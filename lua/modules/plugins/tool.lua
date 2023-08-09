local tool = {}
-- tool["edluffy/hologram.nvim"] = {
-- 	lazy = false,
-- 	config = require("tool.hologram"),
-- }

-- Please don't remove which-key.nvim otherwise you need to set timeoutlen=300 at `lua/core/options.lua`
tool["folke/which-key.nvim"] = {
	lazy = true,
	event = "VeryLazy",
	config = require("tool.which-key"),
}
tool["nvim-neorg/neorg"] = {
	lazy = false,
	tag = "v4.0.1",
	-- event = "VeryLazy",
	build = ":Neorg sync-parsers",
	config = require("tool.neorg"),
	dependencies = { { "nvim-lua/plenary.nvim" } },
}
-- jupyter-nvim
tool["dccsillag/magma-nvim"] = {
	lazy = true,
	build = ":UpdateRemotePlugins",
	event = "VeryLazy",
	config = require("tool.magma"),
}
tool["chentoast/marks.nvim"] = {
	lazy = true,
	event = "BufReadPost",
	config = require("tool.marks"),
}

tool["tversteeg/registers.nvim"] = {
	name = "registers",
	event = "BufReadPost",
	config = require("tool.registers"),
}

tool["nvim-tree/nvim-tree.lua"] = {
	lazy = true,
	cmd = {
		"NvimTreeToggle",
		"NvimTreeOpen",
		"NvimTreeFindFile",
		"NvimTreeFindFileToggle",
		"NvimTreeRefresh",
	},
	config = require("tool.nvim-tree"),
}
tool["Shatur/neovim-session-manager"] = {
	lazy = true,
	cmd = { "SessionManager" },
	config = require("tool.nvim-session-manager"),
	dependencies = {
		{ "nvim-telescope/telescope.nvim" },
	},
}
tool["michaelb/sniprun"] = {
	lazy = true,
	-- You need to cd to `~/.local/share/nvim/site/lazy/sniprun/` and execute `bash ./install.sh`,
	-- if you encountered error about no executable sniprun found.
	build = "bash ./install.sh",
	cmd = { "SnipRun" },
	config = require("tool.sniprun"),
}

tool["akinsho/toggleterm.nvim"] = {
	lazy = true,
	cmd = {
		"ToggleTerm",
		"ToggleTermSetName",
		"ToggleTermToggleAll",
		"ToggleTermSendVisualLines",
		"ToggleTermSendCurrentLine",
		"ToggleTermSendVisualSelection",
	},
	config = require("tool.toggleterm"),
}

tool["folke/trouble.nvim"] = {
	lazy = true,
	cmd = { "Trouble", "TroubleToggle", "TroubleRefresh" },
	config = require("tool.trouble"),
}

tool["sindrets/diffview.nvim"] = {
	lazy = true,
	cmd = { "DiffviewOpen", "DiffviewClose" },
}

tool["Pocco81/true-zen.nvim"] = {
	lazy = true,
	cmd = { "TZFocus", "TZMinimalist" },
	config = require("tool.zenmode"),
}

----------------------------------------------------------------------
--                        Telescope Plugins                         --
----------------------------------------------------------------------
tool["nvim-telescope/telescope.nvim"] = {
	lazy = true,
	cmd = "Telescope",
	config = require("tool.telescope"),
	dependencies = {
		{ "AckslD/nvim-neoclip.lua", config = require("tool.neoclip") },
		{ "nvim-tree/nvim-web-devicons" },
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-lua/popup.nvim" },
		{ "debugloop/telescope-undo.nvim" },
		-- {
		-- 	"ahmedkhalf/project.nvim",
		-- 	event = "BufReadPost",
		-- 	config = require("tool.project"),
		-- },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-telescope/telescope-frecency.nvim", dependencies = {
			{ "kkharji/sqlite.lua" },
		} },
		{ "jvgrootveld/telescope-zoxide" },
		{ "nvim-telescope/telescope-live-grep-args.nvim" },
		{ "nvim-telescope/telescope-ui-select.nvim" },
	},
}

----------------------------------------------------------------------
--                           DAP Plugins                            --
----------------------------------------------------------------------
tool["mfussenegger/nvim-dap"] = {
	lazy = true,
	cmd = {
		"DapSetLogLevel",
		"DapShowLog",
		"DapContinue",
		"DapToggleBreakpoint",
		"DapToggleRepl",
		"DapStepOver",
		"DapStepInto",
		"DapStepOut",
		"DapTerminate",
	},
	config = require("tool.dap"),
	dependencies = {
		{
			"rcarriga/nvim-dap-ui",
			config = require("tool.dap.dapui"),
		},
	},
}
return tool
