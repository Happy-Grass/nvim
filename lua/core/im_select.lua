local M = {}
local default_method_selected = "1033"
local command = "im-select.exe"
local function all_trim(s)
	return s:match("^%s*(.-)%s*$")
end

local function get_current_state(cmd)
	return all_trim(vim.fn.system({ cmd }))
end

local function change_im_select(cmd, state)
	vim.fn.system({ cmd, state })
end

M.start = function()
	-- ensure you have install the im-select
	if vim.fn.executable(command) ~= 1 then
		vim.api.nvim_err_writeln(
			[[please install `im-select` binary first, repo url: https://github.com/daipeihust/im-select]]
		)
		return
	else
		vim.api.nvim_set_var("im_select_current_im_select", "2052") --配置一个初始状态
		vim.api.nvim_create_autocmd({ "InsertEnter" }, {
			callback = function()
				local current_select = get_current_state(command)
				local save = vim.g["im_select_current_im_select"]

				if current_select ~= save then
					change_im_select(command, save)
				end
			end,
		})

		vim.api.nvim_create_autocmd({ "VimEnter", "InsertLeave" }, {
			callback = function()
				local current_select = get_current_state(command)
				vim.api.nvim_set_var("im_select_current_im_select", current_select)

				if current_select ~= default_method_selected then
					change_im_select(command, default_method_selected)
				end
			end,
		})

		-- 恢复没有用vim时的状态,还没有备份
		vim.api.nvim_create_autocmd({ "VimLeave" }, {
			callback = function()
				change_im_select(command, "2052")
			end,
		})
	end
end
return M
