---Keymap utility functions for Neovim configuration
---@module keymaps

local M = {}

---Register a repeatable keymap with vim-repeat support
---
---This function creates a keymap that can be repeated with the `.` command
---by integrating with the vim-repeat plugin. Useful for custom operators
---and motions that should be repeatable.
---
---Example:
---  local keymap = M.make_repeatable("n", "<Plug>(increment)", function()
---    vim.fn.execute("normal! <C-a>")
---  end)
---  vim.keymap.set("n", "+", keymap, { remap = true })
---
---@param mode string|table keymap mode, see vim.keymap.set()
---@param lhs string lhs of the internal keymap, should be in the form `<Plug>(...)`
---@param rhs string|function rhs of the keymap, see vim.keymap.set()
---@return string The registered internal `<Plug>(name)` keymap
function M.make_repeatable(mode, lhs, rhs)
  vim.validate({
    mode = { mode, { "string", "table" } },
    lhs = { lhs, "string" },
    rhs = { rhs, { "string", "function" } },
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

return M

