return function ()

	require("yanky").setup({})

	vim.keymap.set({ "n", "x" }, "y", "<Plug>(YankyYank)")
	vim.keymap.set("n", "<m-n>", "<Plug>(YankyCycleForward)")
	vim.keymap.set("n", "<m-p>", "<Plug>(YankyCycleBackward)")

	vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
	vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
	vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
	vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
	vim.keymap.set("n", "]p", "<Plug>(YankyPutIndentAfterLinewise)")
	vim.keymap.set("n", "[p", "<Plug>(YankyPutIndentBeforeLinewise)")
	vim.keymap.set("n", "]P", "<Plug>(YankyPutIndentAfterLinewise)")
	vim.keymap.set("n", "[P", "<Plug>(YankyPutIndentBeforeLinewise)")

	vim.keymap.set("n", "=p", "<Plug>(YankyPutAfterFilter)")
	vim.keymap.set("n", "=P", "<Plug>(YankyPutBeforeFilter)")

end