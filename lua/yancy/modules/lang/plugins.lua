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
			-- "txt",
			-- "text",
			"gitcomit",
			"scratch",
		}
	end,
}

lang["mzlogin/vim-markdown-toc"] = {
	opt = true,
	ft = { "markdown" },
}
lang["fatih/vim-go"] = {
	opt = true,
	ft = { "go" },
	cond = function()
		return not is_vscode
	end,
	run = ":GoInstallBinaries",
	config = conf.lang_go,
}
lang["simrat39/rust-tools.nvim"] = {
	opt = true,
	ft = "rust",
	config = conf.rust_tools,
	requires = { { "nvim-lua/plenary.nvim", opt = false } },
}
return lang
