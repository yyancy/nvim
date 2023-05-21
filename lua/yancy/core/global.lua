local os_name = vim.loop.os_uname().sysname
global = {}

function global:load_variables()
	self.is_mac = os_name == "Darwin"
	self.is_linux = os_name == "Linux"
	self.is_windows = os_name == "Windows_NT"
	self.vim_path = vim.fn.stdpath("config")
	local path_sep = self.is_windows and "\\" or "/"
	self.sep = path_sep
	local home = self.is_windows and os.getenv("USERPROFILE") or os.getenv("HOME")
	self.cache_dir = home .. path_sep .. ".cache" .. path_sep .. "nvim" .. path_sep
	self.modules_dir = self.vim_path .. path_sep .. "modules"
	self.home = home
	self.data_dir = string.format("%s/site/", vim.fn.stdpath("data"))
	self.is_vscode = vim.g.vscode == 1
  self.is_not_vscode = vim.g.vscode ~= 1 
	-- print("is_vscode" .. str.(self.is_vscode))
end


global:load_variables()

return global

