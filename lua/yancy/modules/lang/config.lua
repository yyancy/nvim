local config = {}

function config.lang_go()
	vim.g.go_def_mode = "gopls"
	vim.g.go_info_mode = "gopls"
	vim.g.go_highlight_types = 1
	vim.g.go_highlight_functions = 1
	vim.g.go_highlight_function_calls = 1
end

return config
