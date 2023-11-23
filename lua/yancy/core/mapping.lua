local global = require("yancy.core.global")

local keymap = vim.keymap.set

keymap("n", "Y", "y$")
keymap("n", "<C-LeftMouse>", "<Plug>(VM-Mouse-Cursor)")
keymap("n", "<C-RightMouse>", "<Plug>(VM-Mouse-Word)")


keymap('n', '<leader>qq', '<cmd>BufDel<cr>')


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

-- ----------------
-- editor section
-- ----------------
keymap("n", "s", "<plug>(SubversiveSubstitute)")
keymap("n", "ss", "<plug>(SubversiveSubstituteLine)")
keymap("n", "S", "<plug>(SubversiveSubstituteToEndOfLine)")
keymap({ "n", "x" }, "<leader>s", "<plug>(SubversiveSubstituteRange)")

keymap({ "o", "x" }, "ib", "<Plug>(textobj-sandwich-auto-i)", { unique = true })
keymap({ "o", "x" }, "ab", "<Plug>(textobj-sandwich-auto-a)", { unique = true })
keymap({ "o", "x" }, "is", "<Plug>(textobj-sandwich-query-i)", { unique = true })
keymap({ "o", "x" }, "as", "<Plug>(textobj-sandwich-query-a)", { unique = true })

-- local tree_api = require("nvim-tree.api")
keymap("n", "<leader>E", ":NvimTreeToggle<CR>")


keymap('n', 'j', '<Plug>(accelerated_jk_gj)')
keymap('n', 'k', '<Plug>(accelerated_jk_gk)')



if global.is_not_vscode then
	keymap("n", "<c-h>", "<cmd>TmuxNavigateLeft<cr>")
	keymap("n", "<c-j>", "<cmd>TmuxNavigateDown<cr>")
	keymap("n", "<c-k>", "<cmd>TmuxNavigateUp<cr>")
	keymap("n", "<c-l>", "<cmd>TmuxNavigateRight<cr>")
end
-- end editor section
