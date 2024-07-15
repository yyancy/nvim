return {
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
  },
  {
    "tpope/vim-abolish",
    vscode = true,
    config = function()
      vim.g.abolish_save_file = vim.fn.stdpath("config") .. "/after/plugin/abolish.vim"
    end,
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
    lazy = false,
    vscode = true,
    dependencies = {
      { "kana/vim-textobj-user", vscode = true },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local feedkey = function(key, mode)
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
      end

      local cmp = require("cmp")
      opts.preselect = cmp.PreselectMode.None
      opts.mapping = vim.tbl_deep_extend("force", opts.mapping, {
        ["<C-f>"] = cmp.mapping(function(fallback)
          -- feedkey("<right>", "")
          fallback()
        end, { "i", "s" }),
        ["<C-b>"] = cmp.mapping(function(fallback)
          -- feedkey("<left>", "")
          fallback()
        end, { "i", "s" }),
        ["<C-u>"] = cmp.mapping.scroll_docs(-4), -- scroll up
        ["<C-d>"] = cmp.mapping.scroll_docs(4), -- scroll down
        ["<a-,>"] = cmp.mapping.complete(),

        -- put here the keymaps that you want to change
      })
    end,
  },
  {
    "gbprod/yanky.nvim",
    enabled = false,
    vscode = true,
  },
  {
    "kkharji/sqlite.lua",
    vscode = true,
  },
  {
    "mg979/vim-visual-multi",
    vscode = true,
    lazy = false,
    keys = {
      { "<C-LeftMouse>", "<Plug>(VM-Mouse-Cursor)", mode = { "n" } },
      { "<C-RightMouse>", "<Plug>(VM-Mouse-Word)", mode = { "n" } },
    },
    config = function()
      vim.g.VM_theme = "ocean"
      vim.g.VM_mouse_mappings = 1
    end,
  },
}
