local M = {}

M.enable_inputmethod = false

M.cmd_chinese = "fcitx-remote -s sogoupinyin"
M.cmd_english = "fcitx-remote -s sogoupinyin"
if LazyVim.is_win() then
  M.cmd_chinese = "D:\\local\\bin\\im-select.exe 2052"
  M.cmd_english = "D:\\local\\bin\\im-select.exe 1033"
end

function M.toggle(enable)
  if enable == nil then
    enable = not M.enable_inputmethod
  end
  M.enable_inputmethod = enable
end

function M.chinse_input()
  if M.enable_inputmethod then
    vim.fn.jobstart(M.cmd_chinese)
  end
end
function M.english_input()
  if M.enable_inputmethod then
    vim.fn.jobstart(M.cmd_english)
  end
end

function M.setup()
  -- add options for auto switch inputmethod
  vim.api.nvim_create_autocmd({ "InsertEnter" }, {
    pattern = { "*" },
    callback = M.chinse_input,
  })
  vim.api.nvim_create_autocmd({ "InsertLeave" }, {
    pattern = { "*" },
    callback = M.english_input,
  })
end

return M
