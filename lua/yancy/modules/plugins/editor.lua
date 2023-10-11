
is_not_vscode = require("yancy.core.global").is_not_vscode
is_vscode = require("yancy.core.global").is_vscode

local editor = {}



editor["junegunn/vim-easy-align"] = {
	lazy = true,
	cmd = "EasyAlign",
	config = function()
		-- Start interactive EasyAlign in visual mode (e.g. vipga)
		vim.keymap.set({ "x", "n" }, "ga", "<Plug>(EasyAlign)")
	end,
}

editor["numToStr/Comment.nvim"] = {
	lazy = false,
  cond = is_not_vscode,
  -- event = { "CursorHold", "CursorHoldI" },
  config = require("editor.comment"),
}
editor["RRethy/vim-illuminate"] = {
	lazy = true,
  cond = is_not_vscode,
	event = { "CursorHold", "CursorHoldI" },
	config = require("editor.vim-illuminate"),
}
-- clear search highlight
-- editor["romainl/vim-cool"] = {
-- 	lazy = true,
-- 	event = { "CursorMoved", "InsertEnter" },
-- }

editor["nvim-treesitter/nvim-treesitter"] = {
	lazy = true,
  cond = is_not_vscode,
  build = function()
    if #vim.api.nvim_list_uis() ~= 0 then
      vim.api.nvim_command("TSUpdate")
    end
  end,
  event = { "CursorHold", "CursorHoldI" },
  config = require("editor.treesitter"),
  dependencies = {
   {"nvim-treesitter/nvim-treesitter-textobjects"},
   {"p00f/nvim-ts-rainbow"},
   {"JoosepAlviste/nvim-ts-context-commentstring"}, 
   { "mfussenegger/nvim-treehopper" },
   {"andymass/vim-matchup",
   config = function()
      vim.api.nvim_set_var("matchup_matchparen_offscreen", { "method", "popup" })
   end
  },
  {
    "windwp/nvim-ts-autotag",
    config = require("editor.autotag"),
  },
  {
    "NvChad/nvim-colorizer.lua",
    config = require("editor.colorizer"),
  },
  {
    "abecodes/tabout.nvim",
    config = require("editor.tabout"),
  },

  }
}

-- editor["hrsh7th/vim-eft"] = { lazy = true, event = "BufReadPost", config = conf.eft }

editor["karb94/neoscroll.nvim"] = {
	lazy = true,
  cond = is_not_vscode,
	event = "BufReadPost",
	config = require('editor.neoscroll')
}

editor["rmagatti/auto-session"] = {
	lazy = true,
  cond = is_not_vscode,
	cmd = { "SessionSave", "SessionRestore", "SessionDelete" },
	config = require("editor.auto-session"),
}

editor["akinsho/toggleterm.nvim"] = {
	lazy = true,
  cmd = {
		"ToggleTerm",
		"ToggleTermSetName",
		"ToggleTermToggleAll",
		"ToggleTermSendVisualLines",
		"ToggleTermSendCurrentLine",
		"ToggleTermSendVisualSelection",
	},
  cond = is_not_vscode,
	config = require("editor.toggleterm"),
}

editor["luukvbaal/stabilize.nvim"] = {
	lazy = true,
  cond = is_not_vscode,
	event = "BufReadPost",
}

editor["AndrewRadev/splitjoin.vim"] = {
  lazy = false
}

editor["matze/vim-move"] = {
  lazy = false
}

editor["svermeulen/vim-subversive"] = {
  lazy = false,
  config = function()

  end
 }

-- editor["https://gitlab.com/yorickpeterse/nvim-pqf.git"] = {
-- 	as = "pqf",
-- 	config = function()
-- 		require("pqf").setup()
-- 	end,
-- }
-- editor["stevearc/qf_helper.nvim"] = {
-- 	config = function()
-- 		require("qf_helper").setup()
-- 	end,
-- }

editor["christoomey/vim-tmux-navigator"] = {
  cond = is_not_vscode,
	config = function()
		vim.g.tmux_navigator_no_mappings = 1
	end,
}

editor["Lilja/zellij.nvim"] = {
	cond = function()
		return not is_vscode
	end,
  config = function()
    require('zellij').setup({})
  end
}
editor["haya14busa/vim-asterisk"] = {
	config = require("editor.asterisk")
}

editor["machakann/vim-sandwich"] = {
	config = require('editor.sandwich')
}

editor["rainbowhxch/accelerated-jk.nvim"] = {
	lazy = true,
	event = "VeryLazy",
	config = require("editor.accelerated-jk"),
}
editor["m4xshen/autoclose.nvim"] = {
	lazy = true,
  cond = is_not_vscode,
	event = "InsertEnter",
	config = require("editor.autoclose"),
}
editor["LunarVim/bigfile.nvim"] = {
	lazy = false,
  cond = is_not_vscode,
	config = require("editor.bigfile"),
	
}

editor["ojroques/nvim-bufdel"] = {
	lazy = true,
	event = "BufReadPost",
}
editor["sindrets/diffview.nvim"] = {
	lazy = true,
	cmd = { "DiffviewOpen", "DiffviewClose" },
}

return editor
