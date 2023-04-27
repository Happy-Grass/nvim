return function()
	require("modules.utils").gen_lspkind_hl()

	local icons = {
		cmp = require("modules.utils.icons").get("cmp", true),
		diagnostics = require("modules.utils.icons").get("diagnostics", true),
		kind = require("modules.utils.icons").get("kind", true),
		type = require("modules.utils.icons").get("type", true),
		ui = require("modules.utils.icons").get("ui", true),
	}

	local function set_sidebar_icons()
		-- Set icons for sidebar.
		local diagnostic_icons = {
			Error = icons.diagnostics.Error_alt,
			Warn = icons.diagnostics.Warning_alt,
			Info = icons.diagnostics.Information_alt,
			Hint = icons.diagnostics.Hint_alt,
		}
		for type, icon in pairs(diagnostic_icons) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl })
		end
	end

	vim.diagnostic.config({
		virtual_text = false,
		signs = true,
		update_in_insert = false,
	})

	set_sidebar_icons()

	require("lspsaga").setup({
		preview = {
			lines_above = 0,
			lines_below = 10,
		},
		scroll_preview = {
			scroll_down = "<C-j>",
			scroll_up = "<C-k>",
		},
		request_timeout = 3000,
		finder = {
			max_height = 0.5,
			keys = {
				jump_to = "p",
				edit = { "o", "<CR>" },
				vsplit = "s",
				split = "i",
				tabe = "t",
				quit = { "q", "<ESC>" },
				close_in_preview = "<ESC>",
			},
		},
		definition = {
			edit = "<C-c>o",
			vsplit = "<C-c>v",
			split = "<C-c>s",
			tabe = "<C-c>t",
			quit = "q",
		},
		code_action = {
			num_shortcut = true,
			show_server_name = false,
			extend_gitsigns = true,
			keys = {
				quit = { "q", "<esc>" },
				exec = "<CR>",
			},
		},
		lightbulb = {
			enable = true,
			sign = true,
			enable_in_insert = true,
			sign_priority = 20,
			virtual_text = false,
		},
		diagnostic = {
			show_code_action = true,
			show_source = true,
			on_insert = true,
			on_insert_follow = false,
			show_virt_line = true,
			border_follow = true,
			jump_num_shortcut = true,
			max_width = 0.7,
			keys = {
				exec_action = "<CR>",
				quit = "q",
				expand_or_jump = "<CR>",
				quit_in_show = { "q", "<ESC>" },
				go_action = "g",
			},
		},
		rename = {
			quit = "<esc>",
			mark = "x",
			confirm = "<CR>",
			exec = "<CR>",
			in_select = true,
		},
		outline = {
			win_position = "right",
			win_with = "_sagaoutline",
			win_width = 30,
			show_detail = true,
			auto_preview = false,
			auto_refresh = true,
			auto_close = true,
			keys = {
				jump = "<CR>",
				expand_collapse = "u",
				quit = "q",
			},
		},
		symbol_in_winbar = {
			enable = true,
			separator = " " .. icons.ui.Separator,
			hide_keyword = true,
			show_file = false,
			folder_level = 2,
			respect_root = false,
			color_mode = true,
		},
		beacon = {
			enable = true,
			frequency = 12,
		},
		ui = {
			border = "double", -- Can be single, double, rounded, solid, shadow.
			winblend = 0,
			expand = icons.ui.ArrowClosed,
			collapse = icons.ui.ArrowOpen,
			code_action = icons.ui.CodeAction,
			incoming = icons.ui.Incoming,
			outgoing = icons.ui.Outgoing,
			diagnostic = " " .. icons.cmp.nvim_lsp,
			kind = {
				-- Kind
				Class = { icons.kind.Class, "LspKindClass" },
				Constant = { icons.kind.Constant, "LspKindConstant" },
				Constructor = { icons.kind.Constructor, "LspKindConstructor" },
				Enum = { icons.kind.Enum, "LspKindEnum" },
				EnumMember = { icons.kind.EnumMember, "LspKindEnumMember" },
				Event = { icons.kind.Event, "LspKindEvent" },
				Field = { icons.kind.Field, "LspKindField" },
				File = { icons.kind.File, "LspKindFile" },
				Function = { icons.kind.Function, "LspKindFunction" },
				Interface = { icons.kind.Interface, "LspKindInterface" },
				Key = { icons.kind.Keyword, "LspKindKey" },
				Method = { icons.kind.Method, "LspKindMethod" },
				Module = { icons.kind.Module, "LspKindModule" },
				Namespace = { icons.kind.Namespace, "LspKindNamespace" },
				Number = { icons.kind.Number, "LspKindNumber" },
				Operator = { icons.kind.Operator, "LspKindOperator" },
				Package = { icons.kind.Package, "LspKindPackage" },
				Property = { icons.kind.Property, "LspKindProperty" },
				Struct = { icons.kind.Struct, "LspKindStruct" },
				TypeParameter = { icons.kind.TypeParameter, "LspKindTypeParameter" },
				Variable = { icons.kind.Variable, "LspKindVariable" },
				-- Type
				Array = { icons.type.Array, "LspKindArray" },
				Boolean = { icons.type.Boolean, "LspKindBoolean" },
				Null = { icons.type.Null, "LspKindNull" },
				Object = { icons.type.Object, "LspKindObject" },
				String = { icons.type.String, "LspKindString" },
				-- ccls-specific icons.
				TypeAlias = { icons.kind.TypeAlias, "LspKindTypeAlias" },
				Parameter = { icons.kind.Parameter, "LspKindParameter" },
				StaticMethod = { icons.kind.StaticMethod, "LspKindStaticMethod" },
				-- Microsoft-specific icons.
				Text = { icons.kind.Text, "LspKindText" },
				Snippet = { icons.kind.Snippet, "LspKindSnippet" },
				Folder = { icons.kind.Folder, "LspKindFolder" },
				Unit = { icons.kind.Unit, "LspKindUnit" },
				Value = { icons.kind.Value, "LspKindValue" },
			},
		},
	})
end
