return function()
	require("neorg").setup({
		load = {
			["core.defaults"] = {},
			["core.dirman"] = {
				config = {
					workspaces = {
						notes = "~/notes",
					},
				},
			},
			["core.concealer"] = {
				config = {
					icon_preset = "basic",
				},
			},
		},
	})

	vim.opt.conceallevel = 3
	vim.opt.concealcursor = "n"
end
