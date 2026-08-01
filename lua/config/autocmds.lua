-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- JSON files: disable spell check and set conceallevel for better readability
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc" },
  callback = function()
    vim.wo.spell = false
    vim.wo.conceallevel = 0
  end,
  desc = "JSON file settings",
})

-- Text-like files: enable spell check and use narrower text width for better readability
-- Applies to: text, markdown, mail, gitcommit
local text_group = vim.api.nvim_create_augroup("text_files", { clear = true })
for _, pat in ipairs({ "text", "markdown", "mail", "gitcommit" }) do
  vim.api.nvim_create_autocmd("FileType", {
    pattern = pat,
    group = text_group,
    callback = function()
      vim.opt_local.spell = true
      vim.opt_local.textwidth = 72
      vim.opt_local.colorcolumn = "73"
    end,
    desc = "Text file formatting settings (tw=72)",
  })
end

-- Make repeatable keymap helper available globally
_G.Make_repeatable_keymap = require("util.keymaps").make_repeatable


