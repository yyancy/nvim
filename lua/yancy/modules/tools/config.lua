local config = {}
local global = require("yancy.core.global")
print(global.sep)

config.open_url = function()
	vim.cmd([[nmap <leader>gB :exe 'OpenURL '. substitute(expand('<cfile>'),'&','"&"','g')<CR>]])
end

function config.telescope()
	vim.cmd([[packadd sqlite.lua]])
	vim.cmd([[packadd telescope-fzf-native.nvim]])
	vim.cmd([[packadd telescope-project.nvim]])
	vim.cmd([[packadd telescope-frecency.nvim]])
	vim.cmd([[packadd telescope-zoxide]])
	vim.cmd([[packadd telescope-coc.nvim]])
	vim.cmd([[packadd telescope-smart-history.nvim]])

	local telescope_actions = require("telescope.actions.set")
	local actions = require("telescope.actions")
	local fixfolds = {
		hidden = true,
		attach_mappings = function(_)
			telescope_actions.select:enhance({
				post = function()
					vim.cmd(":normal! zx")
				end,
			})
			return true
		end,
	}

	require("telescope").setup({
		defaults = {
			mappings = {
				i = {
					["<esc>"] = actions.close,
					["<M-p>"] = actions.cycle_history_prev,
					["<M-n>"] = actions.cycle_history_next,
					["<Up>"] = actions.cycle_history_prev,
					["<Down>"] = actions.cycle_history_next,
				},
			},
			history = {
				path = "~/.local/share/nvim/databases/telescope_history.sqlite3",
				limit = 100,
			},
			initial_mode = "insert",
			prompt_prefix = "  ",
			selection_caret = " ",
			entry_prefix = " ",
			scroll_strategy = "limit",
			results_title = false,
			borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
			layout_strategy = "horizontal",
			display = { "absolute" },
			file_ignore_patterns = { ".git/", ".cache", "%.class", "%.pdf", "%.mkv", "%.mp4", "%.zip" },
			layout_config = {
				-- prompt_position = "bottom",
				horizontal = {
					preview_width = 0.5,
				},
				vertical = {
					preview_cutoff = 60,
				},
			},
			file_previewer = require("telescope.previewers").vim_buffer_cat.new,
			grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
			qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
			file_sorter = require("telescope.sorters").get_fuzzy_file,
			generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
		},
		extensions = {
			fzf = {
				fuzzy = false,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
			frecency = {
				-- show_scores = true,
				-- show_unindexed = true,
				-- sep
				ignore_patterns = {
					"*.git*",
					"*.tmp*",
				},
				default_workspace = "CWD",
			},
			coc = {
				theme = "ivy",
				prefer_locations = true, -- always use Telescope locations to preview definitions/declarations/implementations etc
			},
		},
		pickers = {
			buffers = fixfolds,
			find_files = fixfolds,
			git_files = fixfolds,
			grep_string = fixfolds,
			live_grep = fixfolds,
			oldfiles = fixfolds,
			frecency = {
				theme = "dropdown",
			},
			keymaps = {
				width = 200,
			},
		},
	})

	require("telescope").load_extension("coc")
	require("telescope").load_extension("fzf")
	require("telescope").load_extension("project")
	require("telescope").load_extension("zoxide")
	require("telescope").load_extension("frecency")
	require("telescope").load_extension("smart_history")
end

function config.wilder()
	vim.cmd([[
call wilder#setup({'modes': [':', '/', '?']})
call wilder#set_option('use_python_remote_plugin', 0)
call wilder#set_option('pipeline', [wilder#branch(
	\ wilder#cmdline_pipeline({'use_python': 0,'fuzzy': 1, 'fuzzy_filter': wilder#lua_fzy_filter()}),
	\ wilder#vim_search_pipeline(),
	\ [wilder#check({_, x -> empty(x)}), wilder#history(), wilder#result({'draw': [{_, x -> ' ' . x}]})]
	\ )])
call wilder#set_option('renderer', wilder#renderer_mux({
	\ ':': wilder#popupmenu_renderer({
		\ 'highlighter': wilder#lua_fzy_highlighter(),
		\ 'left': [wilder#popupmenu_devicons()],
		\ 'right': [' ', wilder#popupmenu_scrollbar()]
		\ }),
	\ '/': wilder#wildmenu_renderer({
		\ 'highlighter': wilder#lua_fzy_highlighter(),
		\ 'apply_incsearch_fix': v:true,
		\})
	\ }))
]])
end

function config.vim_visual_multi()
	vim.g.VM_theme = "ocean"
	vim.g.VM_mouse_mappings = 1

	vim.keymap.set("n", "<C-LeftMouse>", "<Plug>(VM-Mouse-Cursor)")
	vim.keymap.set("n", "<C-RightMouse>", "<Plug>(VM-Mouse-Word)")
end

function config.abbrev_man()
	require("abbrev-man").setup({
		load_natural_dictionaries_at_startup = true,
		load_programming_dictionaries_at_startup = true,
		natural_dictionaries = {
			["nt_en"] = {
				["adn"] = "AND",
				["THe"] = "rm_am",
			},
			["nt_my_slangs"] = {
				["lmao"] = "LMAO",
			},
		},
		programming_dictionaries = {
			["pr_py"] = {
				["tset"] = "test",
			},
		},
	})
end

function config.yanky()
	require("yanky").setup({})

	vim.keymap.set({ "n", "x" }, "y", "<Plug>(YankyYank)")
	vim.keymap.set("n", "<m-n>", "<Plug>(YankyCycleForward)")
	vim.keymap.set("n", "<m-p>", "<Plug>(YankyCycleBackward)")

	vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
	vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
	vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
	vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
	vim.keymap.set("n", "]p", "<Plug>(YankyPutIndentAfterLinewise)")
	vim.keymap.set("n", "[p", "<Plug>(YankyPutIndentBeforeLinewise)")
	vim.keymap.set("n", "]P", "<Plug>(YankyPutIndentAfterLinewise)")
	vim.keymap.set("n", "[P", "<Plug>(YankyPutIndentBeforeLinewise)")

	vim.keymap.set("n", "=p", "<Plug>(YankyPutAfterFilter)")
	vim.keymap.set("n", "=P", "<Plug>(YankyPutBeforeFilter)")
end

return config

