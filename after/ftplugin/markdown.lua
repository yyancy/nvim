local map = vim.keymap.set
local opts = { remap = true, silent = true, buffer = true }

-- search markdown links
map("n", "<Tab>", "<Cmd>call search('\\[[^]]*\\]([^)]\\+)')<CR>", opts)
map("n", "<S-Tab>", "<Cmd>call search('\\[[^]]*\\]([^)]\\+)', 'b')<CR>", opts)

local function insert_text_at_start_line(text)
  local row, _ = unpack(vim.api.nvim_win_get_cursor(0))
  vim.api.nvim_buf_set_text(0, row - 1, 0, row - 1, 0, { text })
end

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
map(
  "n",
  ";s1",
  Make_repeatable_keymap("n", "<Plug>(AddTitle3)", function()
    insert_text_at_start_line("### ")
  end),
  opts
)
map(
  "n",
  ";s2",
  Make_repeatable_keymap("n", "<Plug>(AddTitle4)", function()
    insert_text_at_start_line("#### ")
  end),
  opts
)
map(
  "n",
  ";s3",
  Make_repeatable_keymap("n", "<Plug>(AddTitle5)", function()
    insert_text_at_start_line("##### ")
  end),
  opts
)
