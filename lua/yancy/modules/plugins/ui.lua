local ui = {}

is_vscode = require("yancy.core.global").is_vscode
is_not_vscode = require("yancy.core.global").is_not_vscode

if is_vscode then
	return ui
end

ui["goolord/alpha-nvim"] = {
	lazy = true,
	cond = is_not_vscode,
  event = "BufWinEnter",
	config = require('ui.alpha')
}

ui["akinsho/bufferline.nvim"] = {
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("ui.bufferline"),
}

ui["Jint-lzxy/nvim"] = {
	lazy = false,
	branch = "refactor/syntax-highlighting",
	name = "catppuccin",
	config = require("ui.catppuccin"),
}

ui["sainnhe/edge"] = {
	lazy = true,
	config = require("ui.edge"),
}

ui["j-hui/fidget.nvim"] = {
	lazy = true,
	event = "LspAttach",
	config = require("ui.fidget"),
}

ui["lewis6991/gitsigns.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("ui.gitsigns"),
}

ui["lukas-reineke/indent-blankline.nvim"] = {
	lazy = true,
	event = "BufReadPost",
	config = require("ui.indent-blankline"),
}

ui["nvim-lualine/lualine.nvim"] = {
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("ui.lualine"),
}

ui["zbirenbaum/neodim"] = {
	lazy = true,
	event = "LspAttach",
	config = require("ui.neodim"),
}

ui["shaunsingh/nord.nvim"] = {
	lazy = true,
	config = require("ui.nord"),
}

ui["rcarriga/nvim-notify"] = {
	lazy = true,
	event = "VeryLazy",
	config = require("ui.notify"),
}

ui["folke/paint.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("ui.paint"),
}
ui["dstein64/nvim-scrollview"] = {
	lazy = true,
	event = "BufReadPost",
	config = require("ui.scrollview"),
}
ui["edluffy/specs.nvim"] = {
	lazy = true,
	event = "CursorMoved",
	config = require("ui.specs"),
}

-- ui["nvim-tree/nvim-web-devicons"] = {
-- 	config = function()
-- 		require("nvim-web-devicons").setup({
-- 			default = true,
-- 		})
-- 	end,
-- }

-- ui["SmiteshP/nvim-navic"] = {
-- 	lazy = true,
-- 	after = "nvim-lspconfig",
-- 	config = conf.nvim_navic,
-- }

-- ui["shaunsingh/nord.nvim"] = { opt = false, config = conf.nord }
-- ui["sainnhe/edge"] = { opt = false, config = conf.edge }
-- ui["catppuccin/nvim"] = {
-- 	opt = false,
-- 	as = "catppuccin",
-- 	config = conf.catppuccin,
-- }
-- ui["rcarriga/nvim-notify"] = {
-- 	opt = false,
-- 	config = conf.notify,
-- }
-- ui["hoob3rt/lualine.nvim"] = {
-- 	lazy = true,
-- 	after = { "nvim-navic" },
-- 	config = conf.lualine,
-- }
-- ui["SmiteshP/nvim-navic"] = {
-- 	lazy = true,
-- 	after = "nvim-lspconfig",
-- 	config = conf.nvim_navic,
-- }

ui["famiu/bufdelete.nvim"] = {
	config = function()
		vim.keymap.set("n", "<leader><tab>", "<cmd>Bdelete<CR>")
		vim.keymap.set("n", "<leader><S-tab>", "<cmd>Bdelete!<CR>")
	end,
}

-- ui["lukas-reineke/indent-blankline.nvim"] = {
-- 	lazy = true,
-- 	event = "BufReadPost",
-- 	cond = function()
-- 		return not is_vscode
-- 	end,
-- 	config = conf.indent_blankline,
-- }

return ui