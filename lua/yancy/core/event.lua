local vim = vim
not_vscode = require("yancy.core.global").not_vscode
local autocmd = {}

function autocmd.nvim_create_augroups(definitions)
	for group_name, definition in pairs(definitions) do
		vim.api.nvim_command("augroup " .. group_name)
		vim.api.nvim_command("autocmd!")
		for _, def in ipairs(definition) do
			if def.cond and def.cond() then
				local command = table.concat(vim.tbl_flatten({ "autocmd", def }), " ")
				vim.api.nvim_command(command)
			end
		end
		vim.api.nvim_command("augroup END")
	end
end

function autocmd.load_autocmds()
	local definitions = {
		bufs = {
			{

				cond = not_vscode,
				"BufReadPost",
				"*",
				[[if line("'\"") > 2 && line("'\"") <= line("$") | exe "normal! g'\"zz" | endif]],
			},
			{
				-- add mark when cursor is held
				"CursorHold",
				"*",
				[[normal! m']],
			},
		},
		yank = {
			{
				cond = not_vscode,
				"TextYankPost",
				"*",
				[[silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=300})]],
			},
		},
	}
	autocmd.nvim_create_augroups(definitions)
end

autocmd.load_autocmds()
