-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/bashls.lua
return {
	cmd = { "bash-language-server", "start" },
	cmd_env = {
		GLOB_PATTERN = vim.env.GLOB_PATTERN or "*@(.sh|.inc|.bash|.command)",
	},
	root_dir = util.find_git_ancestor,
	filetypes = { "bash", "sh" },
}
