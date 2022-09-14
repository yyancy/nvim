local is_vscode = require 'yancy.core.global'.is_vscode
local tools = { }

local conf = require 'yancy.modules.tools.config'

tools["nvim-lua/plenary.nvim"] = { opt = false }
tools['dhruvasagar/vim-open-url'] = {
  opt = false,
  config = conf.open_url,
}

tools['lambdalisue/suda.vim'] = {
  opt = false,
  cond = function() return not is_vscode end,
  config = function()
    vim.g.suda_smart_edit = 1
  end
}
tools['gcmt/wildfire.vim'] = {
  config = function()
    vim.g.suda_smart_edit = 1
    -- nmap <leader>S <Plug>(wildfire-quick-select)
    vim.keymap.set('n', '<leader>S', '<Plug>(wildfire-quick-select)')
  end
}

tools['wellle/targets.vim'] = { }

tools["nvim-telescope/telescope.nvim"] = {
	opt = true,
  cond = function() return not is_vscode end,
	module = "telescope",
	cmd = "Telescope",
	config = conf.telescope,
	requires = {
		{ "nvim-lua/plenary.nvim", opt = false },
		{ "nvim-lua/popup.nvim", opt = true },
	},
}

tools["nvim-telescope/telescope-fzf-native.nvim"] = {
  cond = function() return not is_vscode end,
	opt = true,
	run = "make",
	after = "telescope.nvim",
}

tools["nvim-telescope/telescope-project.nvim"] = {
	opt = true,
  cond = function() return not is_vscode end,
	after = "telescope-fzf-native.nvim",
}

tools["fannheyward/telescope-coc.nvim"] = {
	opt = true,
  cond = function() return not is_vscode end,
	after = "telescope.nvim",
}
tools["nvim-telescope/telescope-smart-history.nvim"] = {
	opt = true,
  cond = function() return not is_vscode end,
	after = "telescope.nvim",
}

tools["nvim-telescope/telescope-frecency.nvim"] = {
  cond = function() return not is_vscode end,
	opt = true,
	after = "telescope-project.nvim",
	requires = { { "tami5/sqlite.lua", opt = true } },
}
tools["jvgrootveld/telescope-zoxide"] = {
  opt = true, after = "telescope-frecency.nvim" 
}


tools["dstein64/vim-startuptime"] = { opt = true, cmd = "StartupTime" }

tools["gelguy/wilder.nvim"] = {
	event = "CmdlineEnter",
	config = conf.wilder,
	requires = { { "romgrk/fzy-lua-native", after = "wilder.nvim" } },
}


return tools


