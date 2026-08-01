local M = {}

M.pre_yank_pos = {}

function M.pre_yank_motion()
  M.pre_yank_pos = vim.api.nvim_win_get_cursor(0)
end

function M.post_yank_motion()
  if M.pre_yank_pos and #M.pre_yank_pos == 2 then
    vim.api.nvim_win_set_cursor(0, M.pre_yank_pos)
  end
end

function M.setup()
  -- Save cursor position when entering operator-pending mode for yank
  vim.api.nvim_create_autocmd("ModeChanged", {
    pattern = "*:no",
    callback = M.pre_yank_motion,
  })

  vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
      local operators = { "y" }
      if vim.tbl_contains(operators, vim.v.event.operator) then
        local myMode = vim.api.nvim_get_mode().mode
        if (myMode == "no") or (myMode == "n") then
          M.post_yank_motion()
        end
      end
    end,
  })
end

return M
