return function()
	require("cmp_tabnine.config").setup({
		max_line = 1000,
		max_num_results = 20,
		sort = true,
	})
	local prefetch = vim.api.nvim_create_augroup("prefetch", { clear = true })

	vim.api.nvim_create_autocmd("BufRead", {
		group = prefetch,
		pattern = "*.py",
		callback = function()
			require("cmp_tabnine"):prefetch(vim.fn.expand("%:p"))
		end,
	})
end
