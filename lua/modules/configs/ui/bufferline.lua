return function()
	local icons = { ui = require("modules.utils.icons").get("ui") }
	require("bufferline").setup({
		options = {
			number = nil,
			indicator = {
				icon = "▎", -- this should be omitted if indicator style is not 'icon'
				style = "icon", --| 'underline' | 'none',
			},
			close_icon = " ",
			modified_icon = icons.ui.Modified,
			buffer_close_icon = icons.ui.Close,
			left_trunc_marker = icons.ui.Left,
			right_trunc_marker = icons.ui.Right,
			max_name_length = 14,
			max_prefix_length = 13,
			tab_size = 20,
			color_icons = true,
			show_buffer_icons = true,
			show_buffer_close_icons = true,
			show_close_icon = true,
			show_tab_indicators = true,
			enforce_regular_tabs = true,
			persist_buffer_sort = true,
			always_show_bufferline = true,
			separator_style = "thin",
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(count)
				return "(" .. count .. ")"
			end,
			offsets = {
				{
					filetype = "NvimTree",
					text = "󰟐  File Explorer",
					highlight = "Directory",
					text_align = "center",
					padding = 1,
				},
				{
					filetype = "lspsagaoutline",
					text = "Lspsaga Outline",
					text_align = "center",
					padding = 1,
				},
			},
		},
	})
end
