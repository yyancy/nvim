local ui = {}
local conf = require("yancy.modules.ui.config")
is_vscode = require("yancy.core.global").is_vscode

ui["SmiteshP/nvim-navic"] = {
	opt = true,
	after = "nvim-lspconfig",
	config = conf.nvim_navic,
}

ui["kyazdani42/nvim-web-devicons"] = {}
ui["akinsho/bufferline.nvim"] = {
	tag = "v2.*",
	requires = "kyazdani42/nvim-web-devicons",
	cond = function()
		return not is_vscode
	end,
	config = conf.bufferline,
}

ui["famiu/bufdelete.nvim"] = {
	config = function()
		vim.keymap.set("n", "<leader><tab>", "<cmd>Bdelete<CR>")
		vim.keymap.set("n", "<leader><S-tab>", "<cmd>Bdelete!<CR>")
	end,
}

return ui
