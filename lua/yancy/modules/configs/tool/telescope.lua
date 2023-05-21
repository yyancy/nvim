
return function ()
	-- vim.cmd([[packadd sqlite.lua]])
	-- vim.cmd([[packadd telescope-fzf-native.nvim]])
	-- vim.cmd([[packadd telescope-project.nvim]])
	-- vim.cmd([[packadd telescope-frecency.nvim]])
	-- vim.cmd([[packadd telescope-zoxide]])
	-- vim.cmd([[packadd telescope-coc.nvim]])
	-- vim.cmd([[packadd telescope-smart-history.nvim]])

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
				theme = "dropdown",
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