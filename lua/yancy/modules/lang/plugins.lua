local conf = require("yancy.modules.lang.config")
local lang = {}
is_vscode = require("yancy.core.global").is_vscode

lang["iamcco/markdown-preview.nvim"] = {
	opt = true,
	ft = "markdown",
	run = "cd app && yarn install",
	config = function()
		vim.g.mkdp_page_title = ""
	end,
}
lang["dhruvasagar/vim-table-mode"] = {
	-- opt = true,
}
lang["dkarter/bullets.vim"] = {
	-- opt = true,
	config = function()
		vim.g.bullets_enabled_file_types = {
			"markdown",
			"txt",
			"text",
			"gitcomit",
			"scratch",
		}
	end,
}

lang["mzlogin/vim-markdown-toc"] = {
	opt = true,
	ft = { "markdown" },
}

return lang
