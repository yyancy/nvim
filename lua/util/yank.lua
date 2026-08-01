---Yank behavior customization
---
---Preserves cursor position during yank operations.
---When using the 'y' operator, the cursor stays at its original position
---rather than moving to the beginning of the yanked region.
---
---Inspired by YankAssassin.nvim but with a simpler, more efficient approach
---that uses ModeChanged events instead of polling CursorMoved.
---
---@module yank

local M = {}

M.pre_yank_pos = {}

---Save the cursor position when entering operator-pending mode
function M.pre_yank_motion()
  M.pre_yank_pos = vim.api.nvim_win_get_cursor(0)
end

---Restore the cursor position after yank operation
function M.post_yank_motion()
  if M.pre_yank_pos and #M.pre_yank_pos == 2 then
    vim.api.nvim_win_set_cursor(0, M.pre_yank_pos)
  end
end

---Initialize yank position preservation
function M.setup()
  -- Save cursor position when entering operator-pending mode for yank
  vim.api.nvim_create_autocmd("ModeChanged", {
    pattern = "*:no",
    callback = M.pre_yank_motion,
    desc = "Save cursor position for yank operator",
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
    desc = "Restore cursor position after yank",
  })
end

return M

