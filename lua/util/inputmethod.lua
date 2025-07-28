local M = {}

M.enable_inputmethod = true

M.cmd_chinese = "fcitx-remote -s sogoupinyin"
M.cmd_english = "fcitx-remote -s fcitx-ueyboard-us"
if LazyVim.is_win() then
  M.cmd_chinese = "D:\\local\\bin\\im-select.exe 2052"
  M.cmd_english = "D:\\local\\bin\\im-select.exe 1033"
elseif vim.fn.has("macunix") then
  M.cmd_chinese = "macism com.sogou.inputmethod.sogou.pinyin"
  M.cmd_english = "macism com.apple.keylayout.ABC"
end

function M.toggle(enable)
  if enable == nil then
    enable = not M.enable_inputmethod
  end
  M.enable_inputmethod = enable
end

function M.chinese_input()
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
    callback = M.chinese_input,
  })
  vim.api.nvim_create_autocmd({ "InsertLeave" }, {
    pattern = { "*" },
    callback = M.english_input,
  })
end

return M
