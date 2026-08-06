return {
  {
    "tpope/vim-abolish",
    vscode = true,
    init = function()
      -- Disable coercion mappings. I use coerce.nvim for that.
      vim.g.abolish_no_mappings = true
    end,
    config = function()
      vim.g.abolish_save_file = vim.fn.stdpath("config") .. "/after/plugin/abolish.vim"
    end,
  },
  {
    "gregorias/coerce.nvim",
    vscode = true,
    tag = "v5.0.0",
    config = true,
    dependencies = {
      { "gregorias/coop.nvim", vscode = true },
    },
  },
  {
    "christoomey/vim-tmux-navigator",
    keys = {
      { "<c-h>", "<cmd>TmuxNavigateLeft<cr>", mode = "n" },
      { "<c-j>", "<cmd>TmuxNavigateDown<cr>", mode = "n" },
      { "<c-k>", "<cmd>TmuxNavigateUp<cr>", mode = "n" },
      { "<c-l>", "<cmd>TmuxNavigateRight<cr>", mode = "n" },
    },
    config = function()
      vim.g.tmux_navigator_no_mappings = 1
    end,
  },
  {
    -- add iv/av text object for variable name
    "Julian/vim-textobj-variable-segment",
    event = "VeryLazy",
    vscode = true,
    dependencies = {
      { "kana/vim-textobj-user", vscode = true },
    },
  },
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "super-tab",
        ["<CR>"] = {
          "select_and_accept",
          "fallback",
        },
      },
      completion = {
        list = {
          selection = {
            preselect = true,
            auto_insert = false,
          },
        },
      },
    },
  },
  {
    "gbprod/yanky.nvim",
    enabled = false,
    vscode = true,
    -- yanky.nvim provides yank history and better paste behavior
    -- Disabled in favor of custom lua/util/yank.lua implementation
    -- which focuses on cursor position preservation during yank operations
  },
  {
    "kkharji/sqlite.lua",
    vscode = true,
    lazy = false,
    -- sqlite.lua: SQLite wrapper for Lua
    -- Dependency for other plugins (e.g., window management, caching)
    -- Required even if not directly used, provides database functionality to plugins
  },
  {
    "mg979/vim-visual-multi",
    vscode = true,
    keys = {
      { "<C-LeftMouse>", "<Plug>(VM-Mouse-Cursor)", mode = { "n" } },
      { "<C-RightMouse>", "<Plug>(VM-Mouse-Word)", mode = { "n" } },
    },
    config = function()
      vim.g.VM_theme = "ocean"
      vim.g.VM_mouse_mappings = 1
      vim.g.VM_user_operators = { "ciq" }
    end,
  },
}
