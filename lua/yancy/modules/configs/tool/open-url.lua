return function()
	vim.cmd([[nmap <leader>gB :exe 'OpenURL '. substitute(expand('<cfile>'),'&','"&"','g')<CR>]])
end
