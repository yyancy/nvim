-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local set = vim.keymap.set
local opts = { noremap = true, slient = true }
set("n", "<leader><cr>", "<cmd>nohl<cr>", { desc = "clear highlight" })

-- some useful mapping for insert mode
set("i", "<C-f>", "<right>")
set("i", "<C-b>", "<left>")
set("i", "<a-f>", "<C-right>")
set("i", "<a-f>", "<C-right>")
set("i", "<C-a>", "<home>")
set("i", "<C-e>", "<end>")
set("i", "<C-d>", "<del>")

set("o", "b", "vb")
set("o", "F", "vF")
set("o", "T", "vT")
set("n", "0", "_")
set("n", "<leader>ww", "<cmd>w<cr><esc>", { desc = "Save file" })
