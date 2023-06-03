local lang = {}

is_not_vscode = require("yancy.core.global").is_not_vscode
is_vscode = require("yancy.core.global").is_vscode

lang["fatih/vim-go"] = {
	lazy = true,
  cond = is_not_vscode,
	ft = "go",
	build = ":GoInstallBinaries",
	config = require("lang.vim-go"),
}
lang["simrat39/rust-tools.nvim"] = {
	lazy = true,
  cond = is_not_vscode,
	ft = "rust",
	config = require("lang.rust-tools"),
	dependencies = { "nvim-lua/plenary.nvim" },
}
lang["Saecki/crates.nvim"] = {
	lazy = true,
  cond = is_not_vscode,
	event = "BufReadPost Cargo.toml",
	config = require("lang.crates"),
	dependencies = { "nvim-lua/plenary.nvim" },
}
lang["iamcco/markdown-preview.nvim"] = {
	lazy = true,
  cond = is_not_vscode,
	ft = "markdown",
	build = ":call mkdp#util#install()",
}
lang["chrisbra/csv.vim"] = {
	lazy = true,
  cond = is_not_vscode,
	ft = "csv",
}
return lang
