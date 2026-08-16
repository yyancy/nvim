-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local set = vim.keymap.set
local opts = { remap = true, silent = true }

-- Basic command mappings
set("n", "<leader><cr>", "<cmd>nohl<cr>", { desc = "clear highlight" })
set("n", ";<space>", "<cmd>e #<cr>", { desc = "switch to other buffer" })

-- Paste with formatting
set("n", "=p", "o<esc>p==", { desc = "paste below with indent" })
set("n", "=P", "O<esc>p==", { desc = "paste above with indent" })

-- Insert/command mode navigation (Emacs-style)
set({ "i", "c" }, "<C-f>", "<right>", { desc = "move right" })
set({ "i", "c" }, "<C-b>", "<left>", { desc = "move left" })
set({ "i", "c" }, "<a-f>", "<C-right>", { desc = "move to next word" })
set({ "i", "c" }, "<a-b>", "<C-left>", { desc = "move to prev word" })
set({ "i" }, "<a-d>", "<C-o>dw", { desc = "delete word" })
set({ "c" }, "<a-d>", "<C-right><C-w>", { desc = "delete word" })
set({ "i", "c" }, "<C-a>", "<C-o>_", { desc = "move to line start" })
set({ "i", "c" }, "<C-e>", "<end>", { desc = "move to line end" })
set({ "i", "c" }, "<C-d>", "<del>", { desc = "delete char" })

-- Insert mode special
set("i", "<C-t>", "<C-f>", { desc = "forward 1 char" })
set("i", "<C-_>", "<C-o>u", { desc = "undo" })
set("i", "<a-_>", "<C-o><C-r>", { desc = "redo" })
set("n", "<C-a-m>", "<cmd>t.<CR>", { desc = "copy current line below" })
set("i", "<C-a-m>", "<C-o><cmd>t.<CR>", { desc = "copy current line below" })

-- Line movement
set({ "n", "o", "v" }, "L", "$", { desc = "end of line" })
set({ "n", "o", "v" }, "H", "_", { desc = "first non-blank" })

-- Visual mode paste swap
set("x", "p", "P", { desc = "paste without copy" })
set("x", "P", "p", { desc = "paste with copy" })

-- Text object shortcuts
set("n", "yw", "yiw", { desc = "copy word" })
set("n", "yq", "yiq", { remap = true, desc = "copy quoted string" })
set("n", "yb", "yib", { remap = true, desc = "copy bracket content" })

set("n", "dw", "diw", { desc = "delete word" })
set("n", "dq", "diq", { remap = true, desc = "delete quoted string" })
set("n", "db", "dib", { remap = true, desc = "delete bracket content" })

set("n", "sw", "siw", { desc = "surround word" })
set("n", "sq", "siq", { remap = true, desc = "surround quoted" })
set("n", "sb", "sib", { remap = true, desc = "surround bracket" })

set("n", "cw", "ciw", { desc = "change word" })
set("n", "cq", "ciq", { remap = true, desc = "change quoted" })
set("n", "cb", "cib", { remap = true, desc = "change bracket" })

set("n", "xw", "xiw", { desc = "exchange word" })
set("n", "xq", "xiq", { remap = true, desc = "exchange quoted" })
set("n", "xb", "xib", { remap = true, desc = "exchange bracket" })

-- Operator pending text objects
set("o", "b", "vb", { desc = "bracket content" })
set("o", "F", "vF", { desc = "before character" })
set("o", "T", "vT", { desc = "before character backward" })

-- Basic mappings
set("n", "0", "_", { desc = "first non-blank" })
set("n", "<leader>ww", "<cmd>w<cr><esc>", { desc = "save file" })
set("n", "gp", "`[v`]", { desc = "select pasted content" })

-- Window resize
set("n", "<up>", "<cmd>res -5<cr>", { desc = "decrease height" })
set("n", "<down>", "<cmd>res +5<cr>", { desc = "increase height" })
set("n", "<left>", "<cmd>vertical resize-5<CR>", { desc = "decrease width" })
set("n", "<right>", "<cmd>vertical resize+5<CR>", { desc = "increase width" })

-- Selection info
set("n", "gV", "`[v]`", { desc = "select last change" })

-- Repeat in visual mode
set("x", ".", ":norm .<CR>", { silent = false, desc = "repeat last command" })
set("x", "@", ":norm @q<CR>", { silent = false, desc = "repeat macro" })

-- Buffer navigation
set("n", "<leader>h", "<cmd>bprevious<cr>", { desc = "previous buffer" })
set("n", "<leader>l", "<cmd>bnext<cr>", { desc = "next buffer" })

-- Add empty lines
set("n", "[<space>", "<Cmd>call append(line('.') - 1, repeat([''], v:count1))<CR>", { desc = "add line above" })
set("n", "]<space>", "<Cmd>call append(line('.'), repeat([''], v:count1))<CR>", { desc = "add line below" })

-- Disable LazyVim tab keymaps
vim.keymap.del("n", "<leader><tab>l")
vim.keymap.del("n", "<leader><tab>f")
vim.keymap.del("n", "<leader><tab><tab>")
vim.keymap.del("n", "<leader><tab>]")
vim.keymap.del("n", "<leader><tab>d")
vim.keymap.del("n", "<leader><tab>[")
vim.keymap.del("n", "<leader><tab>o")
-- vim.keymap.del("n", "<leader>bb")

set("n", "<leader><tab>", "<C-^>", { desc = "switch to other buffer" })

-- Telescope integration
set("n", "go", "<leader>ss", { remap = true, desc = "grep string" })
set("n", "gO", "<leader>sS", { remap = true, desc = "grep string (visual)" })

-- Diagnostic navigation
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity, float = { max_width = 50 } })
  end
end
set("n", "<leader>n", diagnostic_goto(true), { desc = "next diagnostic" })
set("n", "<leader>p", diagnostic_goto(false), { desc = "prev diagnostic" })

-- Custom utility keymaps
set("n", "<leader>up", require("util.inputmethod").toggle, { desc = "toggle input method" })

local wrap = require("util.auto_wrap")
set("n", "<leader>u88", wrap.toggle, { desc = "toggle auto wrap" })
set("n", "<leader>u89", function()
  print("AutoWrap: " .. wrap.status())
end, { desc = "auto wrap status" })

-- VSCode-specific keymaps
if vim.g.vscode then
  vim.keymap.del("n", "<leader>l")
  require("config.vscode")
else
  set("n", "<leader>;l", "<cmd>Lazy<cr>", { desc = "lazy menu" })
  set("v", "<C-c>", "y", { desc = "copy" })
  set("v", "<C-v>", "p", { desc = "paste" })
  set("i", "<C-v>", "<esc>P`[v`]=`]a", { desc = "paste and format" })
  vim.cmd([[
  inoremap <a-o> <Esc>f"i
  inoremap <a-i> <Esc>F"a
  ]])
end
