local fn, uv, api = vim.fn, vim.loop, vim.api
local is_mac = require("yancy.core.global").is_mac
local vim_path = require("yancy.core.global").vim_path
local data_dir = require("yancy.core.global").data_dir
local modules_dir = vim_path .. "/lua/yancy/modules"
local packer_compiled = data_dir .. "lua/_compiled.lua"
local bak_compiled = data_dir .. "lua/bak_compiled.lua"
local packer = nil

local Packer = {}
Packer.__index = Packer

function Packer:load_plugins()
	self.repos = {}

	local get_plugins_list = function()
		local list = {}
		local tmp = vim.split(fn.globpath(modules_dir, "*/plugins.lua"), "\n")
		for _, f in ipairs(tmp) do
			-- print(f:sub(#modules_dir - 12, -1))
			list[#list + 1] = f:sub(#modules_dir - 12, -1)
		end
		return list
	end

	local plugins_file = get_plugins_list()
	for _, m in ipairs(plugins_file) do
		local repos = require(m:sub(0, #m - 4))
		for repo, conf in pairs(repos) do
			self.repos[#self.repos + 1] = vim.tbl_extend("force", { repo }, conf)
		end
	end
end

function Packer:load_packer()
	if not packer then
		api.nvim_command("packadd packer.nvim")
		packer = require("packer")
		packer.init({
			disable_commands = true,
			display = {
				open_fn = function()
					return require("packer.util").float({ border = "single" })
				end,
			},
			max_jobs = 20,
			compile_path = packer_compiled,
		})
	end

	local use = packer.use
	packer.reset()
	self:load_plugins()
	-- print('self.repos ' .. vim.inspect(self.repos))
	use({ "wbthomason/packer.nvim", opt = true })
	for _, repo in ipairs(self.repos) do
		use(repo)
	end
end

function Packer:init_ensure_plugins()
	local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
	end
	self:load_packer()
	packer.install()
end

local plugins = setmetatable({}, {
	__index = function(_, key)
		if not packer then
			Packer:load_packer()
		end
		return packer[key]
	end,
})

function plugins.ensure_plugins()
	Packer:init_ensure_plugins()
end

function plugins.back_compile()
	if vim.fn.filereadable(packer_compiled) == 1 then
		os.rename(packer_compiled, bak_compiled)
	end
	-- plugins.clean()
	plugins.compile()
	vim.notify("Packer Compile Success!", vim.log.levels.INFO, { title = "Success!" })
end

function plugins.auto_compile()
	local file = vim.fn.expand("%:p")
	if file:match(modules_dir) then
		plugins.clean()
		-- print('comming')
		plugins.back_compile()
	end
end

function plugins.load_compile()
	if vim.fn.filereadable(packer_compiled) == 1 then
		require("_compiled")
	else
		plugins.back_compile()
	end
	local cmds = { "Compile", "Install", "Update", "Sync", "Clean", "Status" }
	for _, cmd in ipairs(cmds) do
		api.nvim_create_user_command("Packer" .. cmd, function()
			require("yancy.core.pack")[cmd == "Compile" and "back_compile" or string.lower(cmd)]()
		end, { force = true })
	end
	api.nvim_create_autocmd("User", {
		pattern = "PackerComplete",
		callback = function()
			require("yancy.core.pack").back_compile()
		end,
	})

	vim.cmd([[
  augroup packer_user_config
    autocmd!
    " autocmd BufWritePost yancy/**/*.lua source <afile> | PackerCompile
    autocmd BufWritePost */yancy/*.lua source <afile> | PackerCompile
  augroup end
]])
end

return plugins

