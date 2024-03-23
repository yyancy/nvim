return {
  "neovim/nvim-lspconfig",
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    -- change a keymap
    -- keys[#keys + 1] = {
    --   "gd",
    --   function()
    --     require("telescope.builtin").lsp_definitions({ reuse_win = true })
    --     vim.cmd("norm! zz")
    --   end,
    -- }
    -- disable a keymap
    -- keys[#keys + 1] = { "K", false }
    -- add a keymap
    -- keys[#keys + 1] = { "H", "<cmd>echo 'hello'<cr>" }
  end,
}
