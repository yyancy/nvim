local config = {}

function config.alpha()
	local alpha = require("alpha")
	local dashboard = require("alpha.themes.dashboard")

	dashboard.section.header.val = {
		[[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
		[[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⣠⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
		[[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣡⣾⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⣿⣟⠻⣿⣿⣿⣿⣿⣿⣿⣿]],
		[[⣿⣿⣿⣿⣿⣿⣿⣿⡿⢫⣷⣿⣿⣿⣿⣿⣿⣿⣾⣯⣿⡿⢧⡚⢷⣌⣽⣿⣿⣿⣿⣿⣶⡌⣿⣿⣿⣿⣿⣿]],
		[[⣿⣿⣿⣿⣿⣿⣿⣿⠇⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣮⣇⣘⠿⢹⣿⣿⣿⣿⣿⣻⢿⣿⣿⣿⣿⣿]],
		[[⣿⣿⣿⣿⣿⣿⣿⣿⠀⢸⣿⣿⡇⣿⣿⣿⣿⣿⣿⣿⣿⡟⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣻⣿⣿⣿⣿]],
		[[⣿⣿⣿⣿⣿⣿⣿⡇⠀⣬⠏⣿⡇⢻⣿⣿⣿⣿⣿⣿⣿⣷⣼⣿⣿⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⢻⣿⣿⣿⣿]],
		[[⣿⣿⣿⣿⣿⣿⣿⠀⠈⠁⠀⣿⡇⠘⡟⣿⣿⣿⣿⣿⣿⣿⣿⡏⠿⣿⣟⣿⣿⣿⣿⣿⣿⣿⣿⣇⣿⣿⣿⣿]],
		[[⣿⣿⣿⣿⣿⣿⡏⠀⠀⠐⠀⢻⣇⠀⠀⠹⣿⣿⣿⣿⣿⣿⣩⡶⠼⠟⠻⠞⣿⡈⠻⣟⢻⣿⣿⣿⣿⣿⣿⣿]],
		[[⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⢿⠀⡆⠀⠘⢿⢻⡿⣿⣧⣷⢣⣶⡃⢀⣾⡆⡋⣧⠙⢿⣿⣿⣟⣿⣿⣿⣿]],
		[[⣿⣿⣿⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⡥⠂⡐⠀⠁⠑⣾⣿⣿⣾⣿⣿⣿⡿⣷⣷⣿⣧⣾⣿⣿⣿⣿⣿⣿⣿]],
		[[⣿⣿⡿⣿⣍⡴⠆⠀⠀⠀⠀⠀⠀⠀⠀⣼⣄⣀⣷⡄⣙⢿⣿⣿⣿⣿⣯⣶⣿⣿⢟⣾⣿⣿⢡⣿⣿⣿⣿⣿]],
		[[⣿⡏⣾⣿⣿⣿⣷⣦⠀⠀⠀⢀⡀⠀⠀⠠⣭⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⣡⣾⣿⣿⢏⣾⣿⣿⣿⣿⣿]],
		[[⣿⣿⣿⣿⣿⣿⣿⣿⡴⠀⠀⠀⠀⠀⠠⠀⠰⣿⣿⣿⣷⣿⠿⠿⣿⣿⣭⡶⣫⠔⢻⢿⢇⣾⣿⣿⣿⣿⣿⣿]],
		[[⣿⣿⣿⡿⢫⣽⠟⣋⠀⠀⠀⠀⣶⣦⠀⠀⠀⠈⠻⣿⣿⣿⣾⣿⣿⣿⣿⡿⣣⣿⣿⢸⣾⣿⣿⣿⣿⣿⣿⣿]],
		[[⡿⠛⣹⣶⣶⣶⣾⣿⣷⣦⣤⣤⣀⣀⠀⠀⠀⠀⠀⠀⠉⠛⠻⢿⣿⡿⠫⠾⠿⠋⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
		[[⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣀⡆⣠⢀⣴⣏⡀⠀⠀⠀⠉⠀⠀⢀⣠⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
		[[⠿⠛⠛⠛⠛⠛⠛⠻⢿⣿⣿⣿⣿⣯⣟⠷⢷⣿⡿⠋⠀⠀⠀⠀⣵⡀⢠⡿⠋⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
		[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠛⢿⣿⣿⠂⠀⠀⠀⠀⠀⢀⣽⣿⣿⣿⣿⣿⣿⣿⣍⠛⠿⣿⣿⣿⣿⣿⣿]],
	}

	local keymap = vim.keymap.set
	keymap("n", "<leader>ff", "<cmd>Telescope frecency theme=dropdown<cr>")
	keymap("n", "<leader>mm", "<cmd>Telescope keymaps theme=dropdown<cr>")
	keymap("n", "<leader>fh", "<cmd>Telescope oldfiles theme=dropdown<cr>")
	keymap("n", "<leader>fa", "<cmd>Telescope live_grep theme=dropdown<cr>")

	-- lsp with coc.vim configurations
	keymap("n", "<leader>tc", ":Telescope coc ")
	keymap("n", "<leader>ls", "<cmd>Telescope coc workspace_symbols theme=dropdown<cr>")
	keymap("n", "gO", "<cmd>Telescope coc document_symbols theme=dropdown<cr>")
	keymap("n", "<leader>lr", "<cmd>Telescope coc references theme=dropdown<cr>")

	local function button(sc, txt, leader_txt, keybind, keybind_opts)
		local sc_after = sc:gsub("%s", ""):gsub(leader_txt, "<leader>")

		local opts = {
			position = "center",
			shortcut = sc,
			cursor = 5,
			width = 50,
			align_shortcut = "right",
			hl_shortcut = "Keyword",
		}

		if nil == keybind then
			keybind = sc_after
		end
		keybind_opts = vim.F.if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
		opts.keymap = { "n", sc_after, keybind, keybind_opts }

		local function on_press()
			-- local key = vim.api.nvim_replace_termcodes(keybind .. '<Ignore>', true, false, true)
			local key = vim.api.nvim_replace_termcodes(sc_after .. "<Ignore>", true, false, true)
			vim.api.nvim_feedkeys(key, "t", false)
		end

		return {
			type = "button",
			val = txt,
			on_press = on_press,
			opts = opts,
		}
	end

	local leader = "comma"
	dashboard.section.buttons.val = {
		button("comma s c", " Scheme change", leader, "<cmd>Telescope colorscheme<cr>"),
		button("comma f r", " File frecency", leader, "<cmd>Telescope frecency<cr>"),
		button("comma f e", " File history", leader, "<cmd>Telescope oldfiles<cr>"),
		button("comma f p", " Project find", leader, "<cmd>Telescope project<cr>"),
		button("comma f f", " File find", leader, "<cmd>Telescope find_files<cr>"),
		button("comma f n", " File new", leader, "<cmd>enew<cr>"),
		button("comma f w", " Word find", leader, "<cmd>Telescope live_grep<cr>"),
	}
	dashboard.section.buttons.opts.hl = "String"

	local function footer()
		local total_plugins = #vim.tbl_keys(packer_plugins)
		return "   Have Fun with neovim"
			.. "   v"
			.. vim.version().major
			.. "."
			.. vim.version().minor
			.. "."
			.. vim.version().patch
			.. "   "
			.. total_plugins
			.. " plugins"
	end

	dashboard.section.footer.val = footer()
	dashboard.section.footer.opts.hl = "Function"

	local head_butt_padding = 2
	local occu_height = #dashboard.section.header.val + 2 * #dashboard.section.buttons.val + head_butt_padding
	local header_padding = math.max(0, math.ceil((vim.fn.winheight("$") - occu_height) * 0.25))
	local foot_butt_padding = 1

	dashboard.config.layout = {
		{ type = "padding", val = header_padding },
		dashboard.section.header,
		{ type = "padding", val = head_butt_padding },
		dashboard.section.buttons,
		{ type = "padding", val = foot_butt_padding },
		dashboard.section.footer,
	}

	alpha.setup(dashboard.opts)
end

function config.bufferline()
	require("bufferline").setup({
		options = {
			numbers = "ordinal",
		},
	})
	keymap = vim.keymap.set
	bufferline = require("bufferline")
	keymap("n", "<leader>1", function()
		bufferline.go_to_buffer(1, true)
	end)
	keymap("n", "<leader>2", function()
		bufferline.go_to_buffer(2, true)
	end)
	keymap("n", "<leader>3", function()
		bufferline.go_to_buffer(3, true)
	end)
	keymap("n", "<leader>4", function()
		bufferline.go_to_buffer(4, true)
	end)
	keymap("n", "<leader>5", function()
		bufferline.go_to_buffer(5, true)
	end)
	keymap("n", "<leader>6", function()
		bufferline.go_to_buffer(6, true)
	end)
	keymap("n", "<leader>7", function()
		bufferline.go_to_buffer(7, true)
	end)
	keymap("n", "<leader>8", function()
		bufferline.go_to_buffer(8, true)
	end)
	keymap("n", "<leader>9", function()
		bufferline.go_to_buffer(9, true)
	end)
	keymap("n", "<leader>gb", "<cmd>BufferLinePick<CR>")
	keymap("n", "[b", "<cmd>BufferLineCyclePrev<CR>")
	keymap("n", "]b", "<cmd>BufferLineCycleNext<CR>")
end

function config.edge()
	vim.g.edge_style = "aura"
	vim.g.edge_enable_italic = 1
	vim.g.edge_disable_italic_comment = 1
	vim.g.edge_show_eob = 1
	vim.g.edge_better_performance = 1
	vim.g.edge_transparent_background = 1
end

function config.nord()
	vim.g.nord_contrast = true
	vim.g.nord_borders = false
	vim.g.nord_cursorline_transparent = true
	vim.g.nord_disable_background = false
	vim.g.nord_enable_sidebar_background = true
	vim.g.nord_italic = true
end

function config.notify()
	local notify = require("notify")
	notify.setup({
		---@usage Animation style one of { "fade", "slide", "fade_in_slide_out", "static" }
		stages = "slide",
		---@usage Function called when a new window is opened, use for changing win settings/config
		on_open = nil,
		---@usage Function called when a window is closed
		on_close = nil,
		---@usage timeout for notifications in ms, default 5000
		timeout = 2000,
		-- Render function for notifications. See notify-render()
		render = "default",
		---@usage highlight behind the window for stages that change opacity
		background_colour = "Normal",
		---@usage minimum width for notification windows
		minimum_width = 50,
		---@usage notifications with level lower than this would be ignored. [ERROR > WARN > INFO > DEBUG > TRACE]
		level = "TRACE",
		---@usage Icons for the different levels
		icons = {
			ERROR = "",
			WARN = "",
			INFO = "",
			DEBUG = "",
			TRACE = "✎",
		},
	})

	vim.notify = notify
end

function config.catppuccin()
	local function get_modified_palette()
		-- We need to explicitly declare our new color.
		-- (Because colors haven't been set yet when we pass them to the setup function.)

		local cp = require("catppuccin.palettes").get_palette() -- Get the palette.
		cp.none = "NONE" -- Special setting for complete transparent fg/bg.

		if vim.g.catppuccin_flavour == "mocha" then -- We only modify the "mocha" palette.
			cp.rosewater = "#F5E0DC"
			cp.flamingo = "#F2CDCD"
			cp.mauve = "#DDB6F2"
			cp.pink = "#F5C2E7"
			cp.red = "#F28FAD"
			cp.maroon = "#E8A2AF"
			cp.peach = "#F8BD96"
			cp.yellow = "#FAE3B0"
			cp.green = "#ABE9B3"
			cp.blue = "#96CDFB"
			cp.sky = "#89DCEB"
			cp.teal = "#B5E8E0"
			cp.lavender = "#C9CBFF"

			cp.text = "#D9E0EE"
			cp.subtext1 = "#BAC2DE"
			cp.subtext0 = "#A6ADC8"
			cp.overlay2 = "#C3BAC6"
			cp.overlay1 = "#988BA2"
			cp.overlay0 = "#6E6C7E"
			cp.surface2 = "#6E6C7E"
			cp.surface1 = "#575268"
			cp.surface0 = "#302D41"

			cp.base = "#1E1E2E"
			cp.mantle = "#1A1826"
			cp.crust = "#161320"
		end

		return cp
	end

	local function set_auto_compile(enable_compile)
		-- Setting auto-compile for catppuccin.
		if enable_compile then
			vim.api.nvim_create_augroup("_catppuccin", { clear = true })

			vim.api.nvim_create_autocmd("User", {
				group = "_catppuccin",
				pattern = "PackerCompileDone",
				callback = function()
					-- require("catppuccin").compile()
					vim.defer_fn(function()
						vim.cmd([[colorscheme catppuccin]])
					end, 0)
				end,
			})
		end
	end

	vim.g.catppuccin_flavour = "mocha" -- Set flavour here
	local cp = get_modified_palette()

	local enable_compile = false -- Set to false if you would like to disable catppuccin cache. (Not recommended)
	set_auto_compile(enable_compile)

	require("catppuccin").setup({
		dim_inactive = {
			enabled = false,
			-- Dim inactive splits/windows/buffers.
			-- NOT recommended if you use old palette (a.k.a., mocha).
			shade = "dark",
			percentage = 0.15,
		},
		transparent_background = false,
		term_colors = true,
		compile = {
			enabled = enable_compile,
			path = vim.fn.stdpath("cache") .. "/catppuccin",
		},
		styles = {
			comments = { "italic" },
			properties = { "italic" },
			functions = { "italic", "bold" },
			keywords = { "italic" },
			operators = { "bold" },
			conditionals = { "bold" },
			loops = { "bold" },
			booleans = { "bold", "italic" },
			numbers = {},
			types = {},
			strings = {},
			variables = {},
		},
		integrations = {
			treesitter = true,
			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = { "italic" },
					hints = { "italic" },
					warnings = { "italic" },
					information = { "italic" },
				},
				underlines = {
					errors = { "underline" },
					hints = { "underline" },
					warnings = { "underline" },
					information = { "underline" },
				},
			},
			lsp_trouble = true,
			lsp_saga = true,
			gitgutter = false,
			gitsigns = true,
			telescope = true,
			nvimtree = true,
			which_key = true,
			indent_blankline = { enabled = true, colored_indent_levels = false },
			dashboard = true,
			neogit = false,
			vim_sneak = false,
			fern = false,
			barbar = false,
			markdown = true,
			lightspeed = false,
			ts_rainbow = true,
			hop = true,
			cmp = true,
			dap = { enabled = true, enable_ui = true },
			notify = true,
			symbols_outline = false,
			coc_nvim = false,
			leap = false,
			neotree = { enabled = false, show_root = true, transparent_panel = false },
			telekasten = false,
			mini = false,
			aerial = false,
			vimwiki = true,
			beacon = false,
			navic = { enabled = true, custom_bg = "NONE" },
			overseer = false,
			fidget = true,
		},
		color_overrides = {
			mocha = {
				rosewater = "#F5E0DC",
				flamingo = "#F2CDCD",
				mauve = "#DDB6F2",
				pink = "#F5C2E7",
				red = "#F28FAD",
				maroon = "#E8A2AF",
				peach = "#F8BD96",
				yellow = "#FAE3B0",
				green = "#ABE9B3",
				blue = "#96CDFB",
				sky = "#89DCEB",
				teal = "#B5E8E0",
				lavender = "#C9CBFF",

				text = "#D9E0EE",
				subtext1 = "#BAC2DE",
				subtext0 = "#A6ADC8",
				overlay2 = "#C3BAC6",
				overlay1 = "#988BA2",
				overlay0 = "#6E6C7E",
				surface2 = "#6E6C7E",
				surface1 = "#575268",
				surface0 = "#302D41",

				base = "#1E1E2E",
				mantle = "#1A1826",
				crust = "#161320",
			},
		},
		highlight_overrides = {
			mocha = {
				-- For base configs.
				CursorLineNr = { fg = cp.green },
				Search = { bg = cp.surface1, fg = cp.pink, style = { "bold" } },
				IncSearch = { bg = cp.pink, fg = cp.surface1 },

				-- For native lsp configs.
				DiagnosticVirtualTextError = { bg = cp.none },
				DiagnosticVirtualTextWarn = { bg = cp.none },
				DiagnosticVirtualTextInfo = { bg = cp.none },
				DiagnosticVirtualTextHint = { fg = cp.rosewater, bg = cp.none },

				DiagnosticHint = { fg = cp.rosewater },
				LspDiagnosticsDefaultHint = { fg = cp.rosewater },
				LspDiagnosticsHint = { fg = cp.rosewater },
				LspDiagnosticsVirtualTextHint = { fg = cp.rosewater },
				LspDiagnosticsUnderlineHint = { sp = cp.rosewater },

				-- For fidget.
				FidgetTask = { bg = cp.none, fg = cp.surface2 },
				FidgetTitle = { fg = cp.blue, style = { "bold" } },

				-- For treesitter.
				TSField = { fg = cp.rosewater },
				TSProperty = { fg = cp.yellow },

				TSInclude = { fg = cp.teal },
				TSOperator = { fg = cp.sky },
				TSKeywordOperator = { fg = cp.sky },
				TSPunctSpecial = { fg = cp.maroon },

				-- TSFloat = { fg = cp.peach },
				-- TSNumber = { fg = cp.peach },
				-- TSBoolean = { fg = cp.peach },

				TSConstructor = { fg = cp.lavender },
				-- TSConstant = { fg = cp.peach },
				-- TSConditional = { fg = cp.mauve },
				-- TSRepeat = { fg = cp.mauve },
				TSException = { fg = cp.peach },

				TSConstBuiltin = { fg = cp.lavender },
				-- TSFuncBuiltin = { fg = cp.peach, style = { "italic" } },
				-- TSTypeBuiltin = { fg = cp.yellow, style = { "italic" } },
				TSVariableBuiltin = { fg = cp.red, style = { "italic" } },

				-- TSFunction = { fg = cp.blue },
				TSFuncMacro = { fg = cp.red, style = {} },
				TSParameter = { fg = cp.rosewater },
				TSKeywordFunction = { fg = cp.maroon },
				TSKeyword = { fg = cp.red },
				TSKeywordReturn = { fg = cp.pink, style = {} },

				-- TSNote = { fg = cp.base, bg = cp.blue },
				-- TSWarning = { fg = cp.base, bg = cp.yellow },
				-- TSDanger = { fg = cp.base, bg = cp.red },
				-- TSConstMacro = { fg = cp.mauve },

				-- TSLabel = { fg = cp.blue },
				TSMethod = { style = { "italic" } },
				TSNamespace = { fg = cp.rosewater },

				TSPunctDelimiter = { fg = cp.teal },
				TSPunctBracket = { fg = cp.overlay2 },
				-- TSString = { fg = cp.green },
				-- TSStringRegex = { fg = cp.peach },
				-- TSType = { fg = cp.yellow },
				TSVariable = { fg = cp.text },
				TSTagAttribute = { fg = cp.mauve, style = { "italic" } },
				TSTag = { fg = cp.peach },
				TSTagDelimiter = { fg = cp.maroon },
				TSText = { fg = cp.text },

				-- TSURI = { fg = cp.rosewater, style = { "italic", "underline" } },
				-- TSLiteral = { fg = cp.teal, style = { "italic" } },
				-- TSTextReference = { fg = cp.lavender, style = { "bold" } },
				-- TSTitle = { fg = cp.blue, style = { "bold" } },
				-- TSEmphasis = { fg = cp.maroon, style = { "italic" } },
				-- TSStrong = { fg = cp.maroon, style = { "bold" } },
				-- TSStringEscape = { fg = cp.pink },

				bashTSFuncBuiltin = { fg = cp.red, style = { "italic" } },
				bashTSParameter = { fg = cp.yellow, style = { "italic" } },

				luaTSField = { fg = cp.lavender },
				luaTSConstructor = { fg = cp.flamingo },

				javaTSConstant = { fg = cp.teal },

				typescriptTSProperty = { fg = cp.lavender, style = { "italic" } },

				cssTSType = { fg = cp.lavender },
				cssTSProperty = { fg = cp.yellow, style = { "italic" } },

				cppTSProperty = { fg = cp.text },
			},
		},
	})
	vim.cmd([[colorscheme catppuccin]])
end

function config.nvim_navic()
	vim.g.navic_silence = true

	require("nvim-navic").setup({
		icons = {
			Method = " ",
			Function = " ",
			Constructor = " ",
			Field = " ",
			Variable = " ",
			Class = "ﴯ ",
			Interface = " ",
			Module = " ",
			Property = "ﰠ ",
			Enum = " ",
			File = " ",
			EnumMember = " ",
			Constant = " ",
			Struct = " ",
			Event = " ",
			Operator = " ",
			TypeParameter = " ",
			Namespace = " ",
			Object = " ",
			Array = " ",
			Boolean = " ",
			Number = " ",
			Null = "ﳠ ",
			Key = " ",
			String = " ",
			Package = " ",
		},
		highlight = true,
		separator = " > ",
		depth_limit = 0,
		depth_limit_indicator = "..",
	})
end

function config.lualine()
	local navic = require("nvim-navic")

	local function escape_status()
		local ok, m = pcall(require, "better_escape")
		return ok and m.waiting and "✺ " or ""
	end

	local function diff_source()
		local gitsigns = vim.b.gitsigns_status_dict
		if gitsigns then
			return {
				added = gitsigns.added,
				modified = gitsigns.changed,
				removed = gitsigns.removed,
			}
		end
	end

	local mini_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "location" },
	}
	local simple_sections = {
		lualine_a = { "mode" },
		lualine_b = { "filetype" },
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "location" },
	}
	local outline = {
		sections = mini_sections,
		filetypes = { "lspsagaoutline" },
	}
	local dapui_scopes = {
		sections = simple_sections,
		filetypes = { "dapui_scopes" },
	}

	local dapui_breakpoints = {
		sections = simple_sections,
		filetypes = { "dapui_breakpoints" },
	}

	local dapui_stacks = {
		sections = simple_sections,
		filetypes = { "dapui_stacks" },
	}

	local dapui_watches = {
		sections = simple_sections,
		filetypes = { "dapui_watches" },
	}

	local function python_venv()
		local function env_cleanup(venv)
			if string.find(venv, "/") then
				local final_venv = venv
				for w in venv:gmatch("([^/]+)") do
					final_venv = w
				end
				venv = final_venv
			end
			return venv
		end

		if vim.bo.filetype == "python" then
			local venv = os.getenv("CONDA_DEFAULT_ENV")
			if venv then
				return string.format("%s", env_cleanup(venv))
			end
			venv = os.getenv("VIRTUAL_ENV")
			if venv then
				return string.format("%s", env_cleanup(venv))
			end
		end
		return ""
	end

	require("lualine").setup({
		options = {
			icons_enabled = true,
			theme = "catppuccin",
			disabled_filetypes = {},
			component_separators = "|",
			section_separators = { left = "", right = "" },
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { { "branch" }, { "diff", source = diff_source } },
			lualine_c = {
				{ navic.get_location, cond = navic.is_available },
			},
			lualine_x = {
				{ escape_status },
				{
					"diagnostics",
					sources = { "nvim_diagnostic" },
					symbols = { error = " ", warn = " ", info = " " },
				},
			},
			lualine_y = {
				{ "filetype", colored = true, icon_only = true },
				{ python_venv },
				{ "encoding" },
				{
					"fileformat",
					icons_enabled = true,
					symbols = {
						unix = "LF",
						dos = "CRLF",
						mac = "CR",
					},
				},
			},
			lualine_z = { "progress", "location" },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		extensions = {
			"quickfix",
			"nvim-tree",
			"toggleterm",
			"fugitive",
			outline,
			dapui_scopes,
			dapui_breakpoints,
			dapui_stacks,
			dapui_watches,
		},
	})
end

function config.indent_blankline()
	require("indent_blankline").setup({
		char = "│",
		show_first_indent_level = true,
		filetype_exclude = {
			"startify",
			"dashboard",
			"dotooagenda",
			"log",
			"fugitive",
			"gitcommit",
			"packer",
			"vimwiki",
			"markdown",
			"json",
			"txt",
			"vista",
			"help",
			"todoist",
			"NvimTree",
			"peekaboo",
			"git",
			"TelescopePrompt",
			"undotree",
			"flutterToolsOutline",
			"", -- for all buffers without a file type
		},
		buftype_exclude = { "terminal", "nofile" },
		show_trailing_blankline_indent = false,
		show_current_context = true,
		context_patterns = {
			"class",
			"function",
			"method",
			"block",
			"list_literal",
			"selector",
			"^if",
			"^table",
			"if_statement",
			"while",
			"for",
			"type",
			"var",
			"import",
		},
		space_char_blankline = " ",
	})

	-- because lazy load indent-blankline so need readd this autocmd
	vim.cmd("autocmd CursorMoved * IndentBlanklineRefresh")
end

return config

