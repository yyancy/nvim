local M = {}

M.enable_inputmethod = true

function M.toggle(enable)
  if enable == nil then
    enable = not M.enable_inputmethod
  end
  M.enable_inputmethod = enable
end

function M.setup()
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
        if M.enable_inputmethod then
          vim.fn.jobstart("fcitx-remote -s sogoupinyin")
        end
      end,
    })
    vim.api.nvim_create_autocmd({ "InsertLeave" }, {
      pattern = { "*" },
      callback = function()
        if M.enable_inputmethod then
          vim.fn.jobstart("fcitx-remote -s fcitx-keyboard-us")
        end
      end,
    })
  end
end

return M
