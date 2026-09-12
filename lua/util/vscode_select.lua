if not vim.g.vscode then
  return
end

local pending = false
local timer = nil

local function arm()
  pending = true

  if timer then
    timer:stop()
    timer:close()
  end

  timer = vim.uv.new_timer()

  timer:start(3000, 0, function()
    vim.schedule(function()
      pending = false

      if timer then
        timer:close()
        timer = nil
      end
    end)
  end)
end

vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = "*:v",
  callback = function()
    if not pending then
      return
    end

    pending = false

    if timer then
      timer:stop()
      timer:close()
      timer = nil
    end

    vim.schedule(function()
      if vim.fn.mode():match("^v") then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
      end
    end)
  end,
})

-- 暴露给 VS Code keybinding 调用
_G.vscode_list_select_arm = arm
