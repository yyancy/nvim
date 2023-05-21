local global = require("yancy.core.global")

local keymap = vim.keymap.set

keymap("n", "Y", "y$")
keymap("n", "<C-LeftMouse>", "<Plug>(VM-Mouse-Cursor)")
keymap("n", "<C-RightMouse>", "<Plug>(VM-Mouse-Word)")
--
-- telescope
keymap("n", "<leader>ff", function()
	require("telescope").extensions.frecency.frecency()
end)
keymap("n", "<leader>mm", "<cmd>Telescope keymaps theme=dropdown<cr>")
keymap("n", "<leader>fh", "<cmd>Telescope oldfiles theme=dropdown<cr>")
keymap("n", "<leader>fa", "<cmd>Telescope live_grep theme=dropdown<cr>")

-- lsp with coc.vim configurations
keymap("n", "<leader>tc", ":Telescope coc ")
-- keymap("n", "<leader>ls", "<cmd>Telescope coc workspace_symbols theme=dropdown<cr>")
-- keymap("n", "gO", "<cmd>Telescope coc document_symbols theme=dropdown<cr>")
-- keymap("n", "<leader>lr", "<cmd>Telescope coc references theme=dropdown<cr>")

keymap("n", "<leader>S", "<Plug>(wildfire-quick-select)")

-- ----------------
-- tool section
-- ----------------
-- urxvtcd/vim-indent-object
keymap("x", "ii", "<Plug>(indent-object_linewise-none)")
keymap("o", "ii", "<Plug>(indent-object_blockwise-none)")
keymap("x", "ai", "<Plug>(indent-object_linewise-start)")
keymap("o", "ai", "<Plug>(indent-object_linewise-start)")
-- end tool section
