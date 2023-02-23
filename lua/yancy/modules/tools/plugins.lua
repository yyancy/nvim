is_vscode = require("yancy.core.global").is_vscode
not_vscode = require("yancy.core.global").not_vscode
local tools = {}

local conf = require("yancy.modules.tools.config")

tools["nvim-lua/plenary.nvim"] = { opt = false }
tools["dhruvasagar/vim-open-url"] = {
	opt = false,
	config = conf.open_url,
}

tools["lambdalisue/suda.vim"] = {
	opt = false,
	cond = function()
		return not is_vscode
	end,
	config = function()
		vim.g.suda_smart_edit = 1
	end,
}
tools["gcmt/wildfire.vim"] = {
	config = function()
		vim.g.suda_smart_edit = 1
		-- nmap <leader>S <Plug>(wildfire-quick-select)
		vim.keymap.set("n", "<leader>S", "<Plug>(wildfire-quick-select)")
	end,
}

tools["kana/vim-textobj-entire"] = {}
tools["wellle/targets.vim"] = {}
tools["urxvtcd/vim-indent-object"] = {
  config = function()
		vim.keymap.set("x", "ii", "<Plug>(indent-object_linewise-none)")
		vim.keymap.set("o", "ii", "<Plug>(indent-object_blockwise-none)")
		vim.keymap.set("x", "ai", "<Plug>(indent-object_linewise-start)")
		vim.keymap.set("o", "ai", "<Plug>(indent-object_linewise-start)")
  end
}

tools["nvim-telescope/telescope.nvim"] = {
	opt = true,
	cond = not_vscode,
	module = "telescope",
	cmd = "Telescope",
	config = conf.telescope,
	requires = {
		{ "nvim-lua/plenary.nvim", opt = false },
		{ "nvim-lua/popup.nvim", opt = true },
	},
}

tools["nvim-telescope/telescope-fzf-native.nvim"] = {
	cond = function()
		return not is_vscode
	end,
	opt = true,
	run = "make",
	after = "telescope.nvim",
}

tools["nvim-telescope/telescope-project.nvim"] = {
	opt = true,
	cond = function()
		return not is_vscode
	end,
	after = "telescope-fzf-native.nvim",
}

tools["fannheyward/telescope-coc.nvim"] = {
	opt = true,
	cond = function()
		return not is_vscode
	end,
	after = "telescope.nvim",
}
tools["nvim-telescope/telescope-smart-history.nvim"] = {
	opt = true,
	cond = function()
		return not is_vscode
	end,
	after = "telescope.nvim",
}

tools["nvim-telescope/telescope-frecency.nvim"] = {
	cond = function()
		return not is_vscode
	end,
	opt = true,
	after = "telescope-project.nvim",
	requires = { { "tami5/sqlite.lua", opt = true } },
}
tools["jvgrootveld/telescope-zoxide"] = {
	opt = true,
	after = "telescope-frecency.nvim",
}

tools["dstein64/vim-startuptime"] = { opt = true, cmd = "StartupTime" }

tools["gelguy/wilder.nvim"] = {
	cond = function()
		return not is_vscode
	end,
	event = "CmdlineEnter",
	config = conf.wilder,
	requires = { { "romgrk/fzy-lua-native", after = "wilder.nvim" } },
}

tools["airblade/vim-rooter"] = {}

tools["mg979/vim-visual-multi"] = {
	config = conf.vim_visual_multi,
}

tools["Pocco81/AbbrevMan.nvim"] = {
	config = conf.abbrev_man,
}
tools["theniceboy/antovim"] = {}
tools["tpope/vim-repeat"] = {}
tools["gbprod/yanky.nvim"] = {
	config = conf.yanky,
}

tools["tversteeg/registers.nvim"] = {}
tools["tpope/vim-abolish"] = {
	config = function()
		vim.g.abolish_save_file = vim.fn.stdpath("config") .. "/after/plugin/abolish.vim"
	end,
}
tools["tpope/vim-rsi"] = {}

return tools
