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
    tag = "v4.1.0",
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
    lazy = false,
    vscode = true,
    dependencies = {
      { "kana/vim-textobj-user", vscode = true },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local feedkey = function(key, mode)
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
      end

      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "emoji" } }))
      opts.preselect = cmp.PreselectMode.None
      opts.mapping = vim.tbl_deep_extend("force", opts.mapping, {
        ["<C-f>"] = cmp.mapping(function(fallback)
          fallback()
        end, { "i", "s" }),
        ["<C-b>"] = cmp.mapping(function(fallback)
          fallback()
        end, { "i", "s" }),
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<a-,>"] = cmp.mapping.complete(),
      })
    end,
  },
  {
    "gbprod/yanky.nvim",
    enabled = false,
    vscode = true,
    -- yanky provides enhanced yank/paste history
    -- disabled in favor of custom yank.lua with cursor position preservation
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
      vim.g.VM_user_operators = { "ciq" }
    end,
  },
}
