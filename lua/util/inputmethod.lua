---Input method auto-switching utility
---
---Automatically switches between Chinese and English input methods
---when entering/leaving insert mode. Platform-specific implementation.
---
---Platform support:
---  - Linux: fcitx-remote (Sogou Pinyin / US English)
---  - Windows: im-select.exe (2052=Chinese, 1033=English)
---  - macOS: macism (Sogou Pinyin / ABC layout)
---
---Configuration:
---  - Toggle: <leader>up (keymap)
---  - Enabled by default
---  - Non-blocking job execution with error handling
---
---@module inputmethod

local M = {}

M.enable_inputmethod = true

-- Platform-specific input method commands
M.cmd_chinese = "fcitx-remote -s sogoupinyin"
M.cmd_english = "fcitx-remote -s keyboard-us"

if LazyVim.is_win() then
  -- Windows: use im-select (2052=Chinese, 1033=English)
  M.cmd_chinese = "D:\\local\\bin\\im-select.exe 2052"
  M.cmd_english = "D:\\local\\bin\\im-select.exe 1033"
elseif vim.fn.has("wsl") == 1 then
  -- WSL 调 Windows 输入法
  M.cmd_chinese = "/mnt/d/local/bin/im-select.exe 2052"
  M.cmd_english = "/mnt/d/local/bin/im-select.exe 1033"
elseif vim.fn.has("macunix") then
  -- macOS: use macism
  M.cmd_chinese = "macism com.sogou.inputmethod.sogou.pinyin"
  M.cmd_english = "macism com.apple.keylayout.ABC"
end

---Toggle input method auto-switching on/off
---@param enable boolean|nil if nil, toggles the current state
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
          vim.notify("Failed to switch to Chinese input (exit code: " .. code .. ")", vim.log.levels.WARN)
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
          vim.notify("Failed to switch to English input (exit code: " .. code .. ")", vim.log.levels.WARN)
        end
      end,
    })
  end
end

---Initialize input method auto-switching
---
---Sets up autocmds to switch input methods on:
---  - InsertEnter: switch to Chinese
---  - InsertLeave: switch to English
function M.setup()
  vim.api.nvim_create_autocmd("InsertEnter", {
    callback = M.chinese_input,
    desc = "Switch to Chinese input on insert mode",
  })
  vim.api.nvim_create_autocmd("InsertLeave", {
    callback = M.english_input,
    desc = "Switch to English input on normal mode",
  })

  vim.notify("Input method auto-switching initialized", vim.log.levels.DEBUG)
end

---Get current Chinese input command
---@return string
function M.get_chinese_cmd()
  return M.cmd_chinese
end

---Get current English input command
---@return string
function M.get_english_cmd()
  return M.cmd_english
end

---Set custom Chinese input command
---@param cmd string command to switch to Chinese
function M.set_chinese_cmd(cmd)
  M.cmd_chinese = cmd
end

---Set custom English input command
---@param cmd string command to switch to English
function M.set_english_cmd(cmd)
  M.cmd_english = cmd
end

return M
