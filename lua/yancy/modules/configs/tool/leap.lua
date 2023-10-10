return function()
	-- require('leap').add_default_mappings()

	vim.keymap.set({ "n", "x", "o" }, "<a-s>", "<Plug>(leap-forward-to)")
	vim.keymap.set({ "n", "x", "o" }, "<a-a>", "<Plug>(leap-backward-to)")
	-- vim.keymap.set({'n', 'x', 'o'}, '<C-S-s>', ':pwd')
	vim.keymap.set({ "x", "o" }, "x", "<Plug>(leap-forward-till)")
	vim.keymap.set({ "x", "o" }, "X", "<Plug>(leap-backward-till)")
	require("leap").add_repeat_mappings(";", ",", {
		-- False by default. If set to true, the keys will work like the
		-- native semicolon/comma, i.e., forward/backward is understood in
		-- relation to the last motion.
		relative_directions = true,
		-- By default, all modes are included.
		modes = { "n", "x", "o" },
	})
end
