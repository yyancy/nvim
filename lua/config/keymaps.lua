-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local set = vim.keymap.set
local opts = { remap = true, silent = true }
set("n", "<leader><cr>", "<cmd>nohl<cr>", { desc = "clear highlight" })
set("n", ";<space>", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

set("n", "=p", "o<esc>p==")
set("n", "=P", "O<esc>p==")
-- some useful mapping for insert mode
set({ "i", "c" }, "<C-f>", "<right>")
set({ "i", "c" }, "<C-b>", "<left>")
set({ "i", "c" }, "<a-f>", "<C-right>")
set({ "i", "c" }, "<a-b>", "<C-left>")
set({ "i" }, "<a-d>", "<C-o>dw")
set({ "c" }, "<a-d>", "<C-right><C-w>")
set({ "i", "c" }, "<C-a>", "<C-o>_")
set({ "i", "c" }, "<C-e>", "<end>")
set({ "i", "c" }, "<C-d>", "<del>")
set("i", "<C-t>", "<C-f>")
set("i", "<C-_>", "<C-o>u")
set("i", "<a-_>", "<C-o><C-r>")
set("n", "<C-a-m>", "<cmd>t.<CR>")
set("i", "<C-a-m>", "<C-o><cmd>t.<CR>")

set({ "n", "o", "v" }, "L", "$")
set({ "n", "o", "v" }, "H", "_")
set("x", "p", "P")
set("x", "P", "p")

set("n", "yw", "yiw")
set("n", "yq", "yiq", { remap = true })
set("n", "yb", "yib", { remap = true })

set("n", "dw", "diw")
set("n", "dq", "diq", { remap = true })
set("n", "db", "dib", { remap = true })

set("n", "sw", "siw")
set("n", "sq", "siq", { remap = true })
set("n", "sb", "sib", { remap = true })

set("n", "cw", "ciw")
set("n", "cq", "ciq", { remap = true })
set("n", "cb", "cib", { remap = true })

set("n", "xw", "xiw")
set("n", "xq", "xiq", { remap = true })
set("n", "xb", "xib", { remap = true })

set("o", "b", "vb")
set("o", "F", "vF")
set("o", "T", "vT")
set("n", "0", "_")
set("n", "<leader>ww", "<cmd>w<cr><esc>", { desc = "Save file" })
set("n", "gp", "`[v`]", { desc = "select pasted content" })

set("n", "<up>", "<cmd>res -5<cr>")
set("n", "<down>", "<cmd>res +5<cr>")
set("n", "<left>", "<cmd>vertical resize-5<CR>")
set("n", "<right>", "<cmd>vertical resize+5<CR>")
set("n", "gV", "`[v]`")

set("x", ".", ":norm .<CR>", { silent = false })
set("x", "@", ":norm @q<CR>", { silent = false })

set("n", "<leader>h", "<cmd>bprevious<cr>", { desc = "Previous Buffer" })
set("n", "<leader>l", "<cmd>bnext<cr>", { desc = "Next Buffer" })

vim.keymap.set("n", "[<space>", "<Cmd>call append(line('.') - 1, repeat([''], v:count1))<CR>")
vim.keymap.set("n", "]<space>", "<Cmd>call append(line('.'),     repeat([''], v:count1))<CR>")

-- tabs
vim.keymap.del("n", "<leader><tab>l")
vim.keymap.del("n", "<leader><tab>f")
vim.keymap.del("n", "<leader><tab><tab>")
vim.keymap.del("n", "<leader><tab>]")
vim.keymap.del("n", "<leader><tab>d")
vim.keymap.del("n", "<leader><tab>[")
vim.keymap.del("n", "<leader><tab>o")

set("n", "<leader><tab>", "<C-^>", { desc = "Switch to Other Buffer" })

set("n", "go", "<leader>ss", { remap = true })
set("n", "gO", "<leader>sS", { remap = true })

-- diagnostic
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity, float = { max_width = 50 } })
  end
end
set("n", "<leader>n", diagnostic_goto(true), { desc = "Next Diagnostic" })
set("n", "<leader>p", diagnostic_goto(false), { desc = "Prev Diagnostic" })

-- Custom function keymaps
vim.keymap.set("n", "<leader>up", require("util.inputmethod").toggle, { desc = "toggle switch inputmethod" })

local wrap = require("util.auto_wrap")

vim.keymap.set("n", "<leader>u88", wrap.toggle, {
  desc = "Toggle Auto Wrap",
})

vim.keymap.set("n", "<leader>u89", function()
  print("AutoWrap: " .. wrap.status())
end, {
  desc = "Auto Wrap Status",
})

-- keymaps for vscode
if vim.g.vscode then
  vim.keymap.del("n", "<leader>l")
  require("config.vscode")
else
  set("n", "<leader>;l", "<cmd>Lazy<cr>", { desc = "Lazy" })
  set("v", "<C-c>", "y")
  set("v", "<C-v>", "p")
  set("i", "<C-v>", "<esc>P`[v`]=`]a")
  vim.cmd([[
  inoremap <a-o> <Esc>f"i
  inoremap <a-i> <Esc>F"a
  ]])
end
