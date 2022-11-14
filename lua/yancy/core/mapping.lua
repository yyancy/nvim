local global = require("yancy.core.global")

local keymap = vim.keymap

keymap.set("n", "<C-LeftMouse>", "<Plug>(VM-Mouse-Cursor)")
keymap.set("n", "<C-RightMouse>", "<Plug>(VM-Mouse-Word)")

