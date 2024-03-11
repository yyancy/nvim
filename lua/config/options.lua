-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- add options for auto switch inputmethod
if jit.os:find("Windows") then
  vim.cmd([[au InsertLeave *  :silent :!D:\\local\\bin\\im-select.exe 1033]])
  vim.cmd([[au InsertEnter *  :silent :!D:\\local\\bin\\im-select.exe 2052]])
elseif vim.fn.executable("fcitx-remote") == 1 then
  -- vim.cmd([[au InsertLeave *  :silent :!fcitx-remote -s fcitx-keyboard-us]])
  -- vim.cmd([[au InsertEnter *  :silent :!fcitx-remote -s sogoupinyin]])

  vim.api.nvim_create_autocmd({ "InsertEnter" }, {
    pattern = { "*" },
    callback = function()
      vim.fn.jobstart("fcitx-remote -s sogoupinyin")
    end,
  })
  vim.api.nvim_create_autocmd({ "InsertLeave" }, {
    pattern = { "*" },
    callback = function()
      vim.fn.jobstart("fcitx-remote -s fcitx-keyboard-us")
    end,
  })
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
