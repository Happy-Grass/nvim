local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
local map_callback = bind.map_callback
local et = bind.escape_termcode

local plug_map = {
	-- Plugin: accelerate-jk
	["n|j"] = map_callback(function()
		return et("<Plug>(accelerated_jk_gj)")
	end):with_expr(),
	["n|k"] = map_callback(function()
		return et("<Plug>(accelerated_jk_gk)")
	end):with_expr(),

	-- Plugin: comment.nvim
	["n|gcc"] = map_callback(function()
			return vim.v.count == 0 and et("<Plug>(comment_toggle_linewise_current)")
				or et("<Plug>(comment_toggle_linewise_count)")
		end)
		:with_silent()
		:with_noremap()
		:with_expr()
		:with_desc("edit: Toggle comment for line"),
	["n|gbc"] = map_callback(function()
			return vim.v.count == 0 and et("<Plug>(comment_toggle_blockwise_current)")
				or et("<Plug>(comment_toggle_blockwise_count)")
		end)
		:with_silent()
		:with_noremap()
		:with_expr()
		:with_desc("edit: Toggle comment for block"),
	["n|gc"] = map_cmd("<Plug>(comment_toggle_linewise)")
		:with_silent()
		:with_noremap()
		:with_desc("edit: Toggle comment for line with operator"),
	["n|gb"] = map_cmd("<Plug>(comment_toggle_blockwise)")
		:with_silent()
		:with_noremap()
		:with_desc("edit: Toggle comment for block with operator"),
	["x|gc"] = map_cmd("<Plug>(comment_toggle_linewise_visual)")
		:with_silent()
		:with_noremap()
		:with_desc("edit: Toggle comment for line with selection"),
	["x|gb"] = map_cmd("<Plug>(comment_toggle_blockwise_visual)")
		:with_silent()
		:with_noremap()
		:with_desc("edit: Toggle comment for block with selection"),

	-- Plugin: diffview
	["n|<leader>D"] = map_cr("DiffviewOpen"):with_silent():with_noremap():with_desc("git: Show diff"),
	["n|<leader><leader>D"] = map_cr("DiffviewClose"):with_silent():with_noremap():with_desc("git: Close diff"),

	-- Plugin: tabout
	["i|<A-l>"] = map_cmd("<Plug>(TaboutMulti)"):with_silent():with_noremap():with_desc("edit: Goto end of pair"),
	["i|<A-h>"] = map_cmd("<Plug>(TaboutBackMulti)"):with_silent():with_noremap():with_desc("edit: Goto begin of pair"),
}

bind.nvim_load_mapping(plug_map)
