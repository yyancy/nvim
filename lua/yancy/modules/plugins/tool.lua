is_not_vscode = require("yancy.core.global").is_not_vscode
is_vscode = require("yancy.core.global").is_vscode

local tool = {}

tool["nvim-lua/plenary.nvim"] = { lazy = false }

-- tool["tpope/vim-fugitive"] = {
-- 	lazy = true,
-- 	cmd = { "Git", "G" },
-- }
-- only for fcitx5 user who uses non-English language during coding
-- tool["pysan3/fcitx5.nvim"] = {
-- 	lazy = true,
-- 	event = "BufReadPost",
-- 	cond = vim.fn.executable("fcitx5-remote") == 1,
-- 	config = require("tool.fcitx5"),
-- }
tool["nvim-tree/nvim-tree.lua"] = {
	lazy = false,
	cond = is_not_vscode,
	-- cmd = {
	-- 	"NvimTreeToggle",
	-- 	"NvimTreeOpen",
	-- 	"NvimTreeFindFile",
	-- 	"NvimTreeFindFileToggle",
	-- 	"NvimTreeRefresh",
	-- },
	config = require("tool.nvim-tree"),
}

tool["michaelb/sniprun"] = {
	lazy = true,
	-- You need to cd to `~/.local/share/nvim/site/lazy/sniprun/` and execute `bash ./install.sh`,
	-- if you encountered error about no executable sniprun found.
	build = "bash ./install.sh",
	cmd = { "SnipRun" },
	config = require("tool.sniprun"),
}

tool["dhruvasagar/vim-open-url"] = {
	lazy = false,
	config = require("tool.open-url"),
}

tool["lambdalisue/suda.vim"] = {
	lazy = false,
	cond = is_not_vscode,
	config = function()
		vim.g.suda_smart_edit = 1
	end,
}

-- <space> quickly select region
tool["gcmt/wildfire.vim"] = {}

tool["kana/vim-textobj-user"] = { lazy = false }
tool["Julian/vim-textobj-variable-segment"] = {
	lazy = false,
	dependencies = {
		{ "kana/vim-textobj-user" },
	},
}
tool["kana/vim-textobj-entire"] = {
	lazy = false,
	dependencies = {
		{ "kana/vim-textobj-user" },
	},
}
tool["wellle/targets.vim"] = { lazy = false }

tool["urxvtcd/vim-indent-object"] = {}

tool["nvim-telescope/telescope.nvim"] = {
	lazy = true,
	cond = is_not_vscode,
	module = "telescope",
	cmd = "Telescope",
	config = require("tool.telescope"),
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-lua/popup.nvim" },
		{ "nvim-telescope/telescope-smart-history.nvim" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-telescope/telescope-project.nvim" },
		{ "nvim-telescope/telescope-frecency.nvim", dependencies = {
			{ "kkharji/sqlite.lua" },
		} },
		{ "jvgrootveld/telescope-zoxide" },
		{ "fannheyward/telescope-coc.nvim" },
	},
}

tool["dstein64/vim-startuptime"] = { lazy = true, cmd = "StartupTime" }

tool["gelguy/wilder.nvim"] = {
	cond = is_not_vscode,
	event = "CmdlineEnter",
	config = require("tool.wilder"),
	dependencies = { "romgrk/fzy-lua-native" },
}

tool["airblade/vim-rooter"] = {}

tool["mg979/vim-visual-multi"] = {
	config = require("tool.visual-multi"),
}

tool["yyancy/abbrev-man.nvim"] = {
	config = require("tool.abbrev-man"),
	lazy = false,
}
tool["theniceboy/antovim"] = {}
tool["tpope/vim-repeat"] = {}
tool["gbprod/yanky.nvim"] = {
	config = require("tool.yanky"),
}
tool["tversteeg/registers.nvim"] = {}
tool["tpope/vim-abolish"] = {
	config = function()
		vim.g.abolish_save_file = vim.fn.stdpath("config") .. "/after/plugin/abolish.vim"
	end,
}
tool["tpope/vim-rsi"] = {}

tool["ibhagwan/smartyank.nvim"] = {
	config = require("tool.smarkyank"),
}
tool["folke/trouble.nvim"] = {
	lazy = true,
	cmd = { "Trouble", "TroubleToggle", "TroubleRefresh" },
	config = require("tool.trouble"),
}

tool["ggandor/leap.nvim"] = {
	lazy = false,
	config = require("tool.leap"),
}

tool["ggandor/flit.nvim"] = {
	lazy = false,
	dependencies = {
		"ggandor/leap.nvim",
	},
	config = function()
		require("flit").setup({
			labeled_modes = "nv",
		})
	end,
}
tool["ggandor/leap-spooky.nvim"] = {
	lazy = false,
	dependencies = {
		"ggandor/leap.nvim",
	},
	config = function()
		require("leap-spooky").setup()
	end,
}

-- split

-- tool["ibhagwan/smartyank.nvim"] = {
-- 	lazy = true,
-- 	event = "BufReadPost",
-- 	config = require("tool.smartyank"),
-- }
-- tool["michaelb/sniprun"] = {
-- 	lazy = true,
-- 	-- You need to cd to `~/.local/share/nvim/site/lazy/sniprun/` and execute `bash ./install.sh`,
-- 	-- if you encountered error about no executable sniprun found.
-- 	build = "bash ./install.sh",
-- 	cmd = { "SnipRun" },
-- 	config = require("tool.sniprun"),
-- }
-- tool["akinsho/toggleterm.nvim"] = {
-- 	lazy = true,
-- 	cmd = {
-- 		"ToggleTerm",
-- 		"ToggleTermSetName",
-- 		"ToggleTermToggleAll",
-- 		"ToggleTermSendVisualLines",
-- 		"ToggleTermSendCurrentLine",
-- 		"ToggleTermSendVisualSelection",
-- 	},
-- 	config = require("tool.toggleterm"),
-- }
-- tool["folke/trouble.nvim"] = {
-- 	lazy = true,
-- 	cmd = { "Trouble", "TroubleToggle", "TroubleRefresh" },
-- 	config = require("tool.trouble"),
-- }
-- tool["folke/which-key.nvim"] = {
-- 	lazy = true,
-- 	event = { "CursorHold", "CursorHoldI" },
-- 	config = require("tool.which-key"),
-- }
-- tool["gelguy/wilder.nvim"] = {
-- 	lazy = true,
-- 	event = "CmdlineEnter",
-- 	config = require("tool.wilder"),
-- 	dependencies = { "romgrk/fzy-lua-native" },
-- }

----------------------------------------------------------------------
--                        Telescope Plugins                         --
----------------------------------------------------------------------
-- tool["nvim-telescope/telescope.nvim"] = {
-- 	lazy = true,
-- 	cmd = "Telescope",
-- 	config = require("tool.telescope"),
-- 	dependencies = {
-- 		{ "nvim-tree/nvim-web-devicons" },
-- 		{ "nvim-lua/plenary.nvim" },
-- 		{ "debugloop/telescope-undo.nvim" },
-- 		{
-- 			"ahmedkhalf/project.nvim",
-- 			event = "BufReadPost",
-- 			config = require("tool.project"),
-- 		},
-- 		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
-- 		{ "nvim-telescope/telescope-frecency.nvim", dependencies = {
-- 			{ "kkharji/sqlite.lua" },
-- 		} },
-- 		{ "jvgrootveld/telescope-zoxide" },
-- 		{ "nvim-telescope/telescope-live-grep-args.nvim" },
-- 	},
-- }

----------------------------------------------------------------------
--                           DAP Plugins                            --
----------------------------------------------------------------------
-- tool["mfussenegger/nvim-dap"] = {
-- 	lazy = true,
-- 	cmd = {
-- 		"DapSetLogLevel",
-- 		"DapShowLog",
-- 		"DapContinue",
-- 		"DapToggleBreakpoint",
-- 		"DapToggleRepl",
-- 		"DapStepOver",
-- 		"DapStepInto",
-- 		"DapStepOut",
-- 		"DapTerminate",
-- 	},
-- 	config = require("tool.dap"),
-- 	dependencies = {
-- 		{
-- 			"rcarriga/nvim-dap-ui",
-- 			config = require("tool.dap.dapui"),
-- 		},
-- 	},
-- }

return tool
