local config = {}
local global = require("yancy.core.global")
print(global.sep)

config.open_url = function()
	vim.cmd([[nmap <leader>gB :exe 'OpenURL '. substitute(expand('<cfile>'),'&','"&"','g')<CR>]])
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

	-- vim.keymap.set("n", "<C-LeftMouse>", "<Plug>(VM-Mouse-Cursor)")
	-- vim.keymap.set("n", "<C-RightMouse>", "<Plug>(VM-Mouse-Word)")
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

