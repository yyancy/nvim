-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

if jit.os:find("Windows") then
  vim.cmd([[au InsertLeave *  :silent :!D:\\local\\bin\\im-select.exe 1033]])
  vim.cmd([[au InsertEnter *  :silent :!D:\\local\\bin\\im-select.exe 2052]])
end
