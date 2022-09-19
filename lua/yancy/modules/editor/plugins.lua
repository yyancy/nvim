local conf = require("yancy.modules.editor.config")
is_vscode = require("yancy.core.global").is_vscode

local editor = {}

editor["junegunn/vim-easy-align"] = {
	opt = true,
	cmd = "EasyAlign",
	config = function()
		-- Start interactive EasyAlign in visual mode (e.g. vipga)
		vim.keymap.set({ "x", "n" }, "ga", "<Plug>(EasyAlign)")
	end,
}
editor["terrortylor/nvim-comment"] = {
	opt = false,
	config = conf.nvim_comment,
}
-- editor["RRethy/vim-illuminate"] = {
-- 	opt = true,
-- 	event = "BufReadPost",
-- 	config = conf.illuminate,
-- }

editor["nvim-treesitter/nvim-treesitter"] = {
	opt = true,
	run = ":TSUpdate",
	event = "BufReadPost",
	config = conf.nvim_treesitter,
	cond = function()
		return not is_vscode
	end,
}

editor["nvim-treesitter/nvim-treesitter-textobjects"] = {
	opt = true,
	after = "nvim-treesitter",
}

editor["p00f/nvim-ts-rainbow"] = {
	opt = true,
	after = "nvim-treesitter",
}

editor["JoosepAlviste/nvim-ts-context-commentstring"] = {
	opt = true,
	after = "nvim-treesitter",
}

editor["mfussenegger/nvim-ts-hint-textobject"] = {
	opt = true,
	after = "nvim-treesitter",
}

-- editor['windwp/nvim-ts-autotag'] = {
--   opt= true,
--   after = "nvim-treesitter",
--    requires = {
--       'nvim-treesitter/nvim-treesitter',
--     },
--   cond = function() return not is_vscode end,
--   config = conf.autotag,
-- }

editor["andymass/vim-matchup"] = {
	cond = function()
		return not is_vscode
	end,
	after = "nvim-treesitter",
	config = conf.matchup,
}

editor["hrsh7th/vim-eft"] = { opt = true, event = "BufReadPost", config = conf.eft }

editor["karb94/neoscroll.nvim"] = {
	opt = true,
	cond = function()
		return not is_vscode
	end,
	event = "BufReadPost",
	config = conf.neoscroll,
}

editor["norcalli/nvim-colorizer.lua"] = {
	opt = true,
	event = "BufReadPost",
	config = conf.nvim_colorizer,
}

editor["rmagatti/auto-session"] = {
	-- opt = true,
	cond = function()
		return not is_vscode
	end,
	-- cmd = { "SaveSession", "RestoreSession", "DeleteSession" },
	config = conf.auto_session,
}

editor["nathom/filetype.nvim"] = {
	opt = false,
	config = conf.filetype,
}
editor["phaazon/hop.nvim"] = {
	opt = true,
	branch = "v2",
	event = "BufReadPost",
	config = conf.hop,
}
editor["akinsho/toggleterm.nvim"] = {
	opt = true,
	event = "UIEnter",
	cond = function()
		return not is_vscode
	end,
	config = conf.toggleterm,
}
editor["luukvbaal/stabilize.nvim"] = {
	opt = true,
	cond = function()
		return not is_vscode
	end,
	event = "BufReadPost",
}

editor["AndrewRadev/splitjoin.vim"] = {}

editor["matze/vim-move"] = {}
editor["svermeulen/vim-subversive"] = {
	config = function()
		vim.keymap.set("n", "s", "<plug>(SubversiveSubstitute)")
		vim.keymap.set("n", "ss", "<plug>(SubversiveSubstituteLine)")
		vim.keymap.set("n", "S", "<plug>(SubversiveSubstituteToEndOfLine)")
		vim.keymap.set({ "n", "x" }, "<leader>s", "<plug>(SubversiveSubstituteRange)")
	end,
}

editor["https://gitlab.com/yorickpeterse/nvim-pqf.git"] = {
	as = "pqf",
	config = function()
		require("pqf").setup()
	end,
}
editor["stevearc/qf_helper.nvim"] = {
	config = function()
		require("qf_helper").setup()
	end,
}

return editor
