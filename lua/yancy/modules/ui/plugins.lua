local ui = {}
local conf = require("yancy.modules.ui.config")
is_vscode = require("yancy.core.global").is_vscode

ui["SmiteshP/nvim-navic"] = {
	opt = true,
	after = "nvim-lspconfig",
	config = conf.nvim_navic,
}

ui["kyazdani42/nvim-web-devicons"] = {
	config = function()
		require("nvim-web-devicons").setup({
			default = true,
		})
	end,
}
ui["shaunsingh/nord.nvim"] = { opt = false, config = conf.nord }
ui["sainnhe/edge"] = { opt = false, config = conf.edge }
ui["catppuccin/nvim"] = {
	opt = false,
	as = "catppuccin",
	config = conf.catppuccin,
}
ui["rcarriga/nvim-notify"] = {
	opt = false,
	config = conf.notify,
}
ui["hoob3rt/lualine.nvim"] = {
	opt = true,
	after = { "nvim-navic" },
	config = conf.lualine,
}
ui["SmiteshP/nvim-navic"] = {
	opt = true,
	after = "nvim-lspconfig",
	config = conf.nvim_navic,
}
ui["goolord/alpha-nvim"] = {
	opt = true,
	cond = function()
		return not is_vscode
	end,
	event = "BufWinEnter",
	config = conf.alpha,
}

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

ui["lukas-reineke/indent-blankline.nvim"] = {
	opt = true,
	event = "BufReadPost",
	cond = function()
		return not is_vscode
	end,
	config = conf.indent_blankline,
}

return ui
