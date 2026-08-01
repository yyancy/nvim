local M = {}

M.enable_inputmethod = true

-- Platform-specific input method commands
M.cmd_chinese = "fcitx-remote -s sogoupinyin"
M.cmd_english = "fcitx-remote -s keyboard-us"

if LazyVim.is_win() then
  -- Windows: use im-select (2052=Chinese, 1033=English)
  M.cmd_chinese = "D:\\local\\bin\\im-select.exe 2052"
  M.cmd_english = "D:\\local\\bin\\im-select.exe 1033"
elseif vim.fn.has("macunix") then
  -- macOS: use macism
  M.cmd_chinese = "macism com.sogou.inputmethod.sogou.pinyin"
  M.cmd_english = "macism com.apple.keylayout.ABC"
end

---Toggle input method auto-switching on/off
function M.toggle(enable)
  if enable == nil then
    enable = not M.enable_inputmethod
  end
  M.enable_inputmethod = enable
  vim.notify("Input method auto-switch: " .. (enable and "ON" or "OFF"), vim.log.levels.INFO)
end

---Switch to Chinese input method
function M.chinese_input()
  if M.enable_inputmethod then
    vim.fn.jobstart(M.cmd_chinese, {
      on_exit = function(_, code)
        if code ~= 0 then
          vim.notify("Failed to switch to Chinese input", vim.log.levels.WARN)
        end
      end,
    })
  end
end

---Switch to English input method
function M.english_input()
  if M.enable_inputmethod then
    vim.fn.jobstart(M.cmd_english, {
      on_exit = function(_, code)
        if code ~= 0 then
          vim.notify("Failed to switch to English input", vim.log.levels.WARN)
        end
      end,
    })
  end
end

---Initialize input method auto-switching
function M.setup()
  vim.api.nvim_create_autocmd("InsertEnter", {
    callback = M.chinese_input,
    desc = "Switch to Chinese input on insert mode",
  })
  vim.api.nvim_create_autocmd("InsertLeave", {
    callback = M.english_input,
    desc = "Switch to English input on normal mode",
  })
end

return M

