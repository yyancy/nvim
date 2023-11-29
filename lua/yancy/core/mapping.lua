local global = require("yancy.core.global")

local keymap = vim.keymap.set

-- general mappings
vim.g.mapleader = " "

keymap("n", "0", "_")
keymap("n", "Y", "y$")
keymap("n", ">", ">>")
keymap("n", "<", "<<")
keymap("v", ">", ">gv")
keymap("v", "<", "<gv")

keymap("n", "n", "nzz")
keymap("n", "N", "Nzz")
keymap("o", "b", "vb")
keymap("o", "F", "vF")
keymap("o", "T", "vT")

keymap("x", "<C-d>", '"ayp')

keymap("n", "<leader>qq", "<cmd>BufDel<cr>")
keymap("n", "<leader><cr>", "<cmd>nohl<cr>")
keymap("n", "<leader><C-q>", "<cmd>q!<cr>")
keymap("n", "<leader>ww", "<cmd>w<cr>")
keymap("n", "<leader>tx", "<cmd>r !figlet")

keymap("i", "<C-t>", "<C-f>")
keymap("i", "<C-e>", "<end>")
keymap("i", "<C-a>", "<home>")
keymap("i", "<a-b>", "<C-o>b")
keymap("i", "<a-f>", "<C-o>w")
keymap("i", "<C-d>", "<del>")
keymap("i", "<C-_>", "<C-o>u")
keymap("i", "<a-_>", "<C-o><C-r>")

keymap("n", ".", ".`[")

keymap("n", "<C-h>", "<C-w><C-h>")
keymap("n", "<C-j>", "<C-w><C-j>")
keymap("n", "<C-k>", "<C-w><C-k>")
keymap("n", "<C-l>", "<C-w><C-l>")

keymap("n", "<leader>wd", "<C-W>c", { desc = "Delete window", remap = true })
keymap("n", "<leader>w-", "<C-W>s", { desc = "Split window below", remap = true })
keymap("n", "<leader>w|", "<C-W>v", { desc = "Split window right", remap = true })
keymap("n", "<leader>-", "<C-W>s", { desc = "Split window below", remap = true })
keymap("n", "<leader>|", "<C-W>v", { desc = "Split window right", remap = true })

keymap("n", "<C-LeftMouse>", "<Plug>(VM-Mouse-Cursor)")
keymap("n", "<C-RightMouse>", "<Plug>(VM-Mouse-Word)")
keymap("n", "<up>", "<cmd>res -5<cr>")
keymap("n", "<down>", "<cmd>res +5<cr>")
keymap("n", "<left>", "<cmd>vertical resize-5<CR>")
keymap("n", "<right>", "<cmd>vertical resize+5<CR>")

keymap("n", "tu", "<cmd>tabe<cr>")
keymap("n", "tp", "<cmd>-tabnext<cr>")
keymap("n", "tn", "<cmd>+tabnext<cr>")
keymap("n", "sv", "<C-w>t<C-w>H")
keymap("n", "sh", "<C-w>t<C-w>K")

--
-- telescope
keymap("n", "<leader>ff", function()
	require("telescope").extensions.frecency.frecency()
end)
keymap("n", "<leader>mm", "<cmd>Telescope keymaps theme=dropdown<cr>")
keymap("n", "<leader>fh", "<cmd>Telescope oldfiles theme=dropdown<cr>")
keymap("n", "<leader>fa", "<cmd>Telescope live_grep theme=dropdown<cr>")

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

vim.cmd([[inoremap <a-o> <Esc>/[)}"'\]>`]<CR>:nohl<CR>a]])
vim.cmd([[inoremap <a-i> <Esc>?[({"'\[<`]<CR>:nohl<CR>a]])
vim.cmd([[ nnoremap [<leader>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[ ]])
vim.cmd([[ nnoremap ]<leader>  :<c-u>put =repeat(nr2char(10), v:count1)<cr> ]])
-- don't know what it do :(
-- nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'

-- local tree_api = require("nvim-tree.api")
keymap("n", "<leader>E", ":NvimTreeToggle<CR>")

keymap("n", "j", "<Plug>(accelerated_jk_gj)")
keymap("n", "k", "<Plug>(accelerated_jk_gk)")

if global.is_not_vscode then
	keymap("v", "<C-c>", "y")
	keymap("v", "<C-v>", "p")
	keymap("i", "<C-S-v>", "<esc>pa")
	keymap("n", "<C-S-v>", "p")

	keymap("n", "<c-h>", "<cmd>TmuxNavigateLeft<cr>")
	keymap("n", "<c-j>", "<cmd>TmuxNavigateDown<cr>")
	keymap("n", "<c-k>", "<cmd>TmuxNavigateUp<cr>")
	keymap("n", "<c-l>", "<cmd>TmuxNavigateRight<cr>")
else
end
-- end editor section
