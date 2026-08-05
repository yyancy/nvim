-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Init custom plugin
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require("util.inputmethod").setup()
    require("util.yank").setup()
  end,
})

-- Customize LSP float window max width for better diagnostics display
-- Reference: https://neovim.discourse.group/t/lsp-hover-float-window-too-wide/3276
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
---@diagnostic disable-next-line: duplicate-set-field
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or "single"
  opts.max_width = opts.max_width or 50
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- Clipboard integration
vim.opt.clipboard = "unnamedplus"

-- Disable Python style recommendations from python.vim
vim.g.python_recommended_style = 0

-- Timeout for key sequences
vim.opt.timeoutlen = 1000

-- Indentation
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

-- Line wrapping
vim.opt.textwidth = 80
vim.opt.colorcolumn = "80"

-- Fix background color in Zellij terminal
vim.schedule(function()
  -- vim.o.background = "dark"
end)
