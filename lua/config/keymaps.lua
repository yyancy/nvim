-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local set = vim.keymap.set
local opts = { noremap = true, slient = true }
set("n", "<leader><cr>", "<cmd>nohl<cr>", { desc = "clear highlight" })

set("n", "=p", "o<esc>p==")
set("n", "=P", "O<esc>p==")
-- some useful mapping for insert mode
set({ "i", "s" }, "<C-f>", "<right>")
set("i", "<C-b>", "<left>")
set("i", "<a-f>", "<C-right>")
set("i", "<a-b>", "<C-left>")
set("i", "<C-a>", "<home>")
set("i", "<C-e>", "<end>")
set("i", "<C-d>", "<del>")
set("i", "<C-t>", "<C-f>")
set("i", "<C-_>", "<C-o>u")
set("i", "<a-_>", "<C-o><C-r>")

set("o", "b", "vb")
set("o", "F", "vF")
set("o", "T", "vT")
set("n", "0", "_")
set("n", "<leader>ww", "<cmd>w<cr><esc>", { desc = "Save file" })

set("n", "<up>", "<cmd>res -5<cr>")
set("n", "<down>", "<cmd>res +5<cr>")
set("n", "<left>", "<cmd>vertical resize-5<CR>")
set("n", "<right>", "<cmd>vertical resize+5<CR>")

-- keymaps for vscode
if vim.g.vscode then
  vim.keymap.del("n", "<leader>l")
  vim.cmd([[source $HOME/.config/nvim/vscode.vim]])
else
  set("v", "<C-c>", "y")
  set("v", "<C-v>", "p")
  set("i", "<C-v>", "<C-o>p")
end
