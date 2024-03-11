local map = vim.keymap.set
local opts = { remap = true, silent = true, buffer = true }

-- search markdown links
map("n", "<Tab>", "<Cmd>call search('\\[[^]]*\\]([^)]\\+)')<CR>", opts)
map("n", "<S-Tab>", "<Cmd>call search('\\[[^]]*\\]([^)]\\+)', 'b')<CR>", opts)

local function insert_text_at_start_line(text)
  local row, _ = unpack(vim.api.nvim_win_get_cursor(0))
  vim.api.nvim_buf_set_text(0, row - 1, 0, row - 1, 0, { text })
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
