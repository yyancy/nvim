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

-- https://neovim.discourse.group/t/lsp-hover-float-window-too-wide/3276
-- diagnostics too long, set max_width smaller :)
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
---@diagnostic disable-next-line: duplicate-set-field
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or "single"
  opts.max_width = opts.max_width or 50
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

vim.cmd([[set clipboard=unnamedplus]])
-- disabled python.vim plugins set shiftwidth
vim.cmd([[let g:python_recommended_style = 0]])
vim.opt.timeoutlen = 1000
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

-- fix wrrong background in zellij
vim.schedule(function()
  vim.o.background = "dark"
end)
