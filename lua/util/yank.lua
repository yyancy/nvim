local M = {}

-- after yanking comtent, keep cursor position
-- https://github.com/svban/YankAssassin.nvim/blob/main/lua/YankAssassin/init.lua
M.pre_yank_pos = {}
-- Function to save the cursor position before yanking
function M.pre_yank_motion()
  M.pre_yank_pos = vim.api.nvim_win_get_cursor(0)
end

-- Function to restore the cursor position after yanking
function M.post_yank_motion()
  vim.api.nvim_win_set_cursor(0, M.pre_yank_pos)
end

function M.setup()
  vim.api.nvim_create_autocmd({ "VimEnter", "CursorMoved" }, {
    callback = function()
      M.pre_yank_motion()
    end,
  })
  vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
      -- Only restore position after yanked with 'y' operator only
      -- If not set, text yanked with c will also activate it
      local operators = { "y" } -- Add more operators here if needed
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
