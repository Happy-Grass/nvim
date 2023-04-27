return function()
	local null_ls = require("null-ls")
	local mason_null_ls = require("mason-null-ls")
	local formatting = null_ls.builtins.formatting
	local diagnostics = null_ls.builtins.diagnostics

	local sources = {
		formatting.prettier,
		formatting.yapf,
		diagnostics.flake8,
		formatting.stylua,
		-- diagnostics.luacheck,
		formatting.latexindent,
		-- diagnostics.vale,
		formatting.beautysh,
		diagnostics.shellcheck,
		formatting.clang_format.with({
			filetypes = { "c", "cpp" },
			extra_args = require("completion.formatters.clang_format"),
		}),
		diagnostics.cpplint,
	}
	null_ls.setup({
		border = "rounded",
		debug = false,
		log_level = "warn",
		update_in_insert = false,
		sources = sources,
	})

	mason_null_ls.setup({
		ensure_installed = require("core.settings").null_ls_deps,
		automatic_installation = false,
		automatic_setup = true,
	})
	-- mason_null_ls.setup_handlers()

	require("completion.formatting").configure_format_on_save()
end
