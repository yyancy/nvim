-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Fix conceallevel for json files

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc" },
  callback = function()
    vim.wo.spell = false
    vim.wo.conceallevel = 0
  end,
})

-- custom fuinctions
--
---Register a global internal keymap that wraps `rhs` to be repeatable.
---@param mode string|table keymap mode, see vim.keymap.set()
---@param lhs string lhs of the internal keymap to be created, should be in the form `<Plug>(...)`
---@param rhs string|function rhs of the keymap, see vim.keymap.set()
---@return string The name of a registered internal `<Plug>(name)` keymap. Make sure you use { remap = true }.
Make_repeatable_keymap = function(mode, lhs, rhs)
  vim.validate({
    mode = { mode, { "string", "table" } },
    rhs = { rhs, { "string", "function" }, lhs = { name = "string" } },
  })
  if not vim.startswith(lhs, "<Plug>") then
    error("`lhs` should start with `<Plug>`, given: " .. lhs)
  end
  vim.keymap.set(mode, lhs, function()
    rhs()
    vim.fn["repeat#set"](vim.api.nvim_replace_termcodes(lhs, true, true, true))
  end)
  return lhs
end

-- after yanking comtent, keep cursor position
-- https://github.com/svban/YankAssassin.nvim/blob/main/lua/YankAssassin/init.lua
local pre_yank_pos = {}
-- Function to save the cursor position before yanking
local function pre_yank_motion()
  pre_yank_pos = vim.api.nvim_win_get_cursor(0)
end

-- Function to restore the cursor position after yanking
local function post_yank_motion()
  vim.api.nvim_win_set_cursor(0, pre_yank_pos)
end

vim.api.nvim_create_autocmd({ "VimEnter", "CursorMoved" }, {
  callback = function()
    pre_yank_motion()
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
        post_yank_motion()
      end
    end
  end,
})
