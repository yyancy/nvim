local ai = require("mini.ai")
return {
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
  },
  {
    "echasnovski/mini.ai",
    enabled = true,
    opts = {
      custom_textobjects = {
        s = {
          {
            ai.gen_spec.pair(",", ","),
            ai.gen_spec.pair(".", "."),
            ai.gen_spec.pair(";", ";"),
            ai.gen_spec.pair(":", ":"),
            ai.gen_spec.pair("+", "+"),
            ai.gen_spec.pair("-", "-"),
            ai.gen_spec.pair("=", "="),
            ai.gen_spec.pair("~", "~"),
            ai.gen_spec.pair("_", "_"),
            ai.gen_spec.pair("*", "*"),
            ai.gen_spec.pair("#", "#"),
            ai.gen_spec.pair("/", "/"),
            ai.gen_spec.pair("\\", "\\"),
            ai.gen_spec.pair("|", "|"),
            ai.gen_spec.pair("&", "&"),
            ai.gen_spec.pair("$", "$"),
          },
          "^.()().*().()$",
        },
        b = {

          { "%b()", "%b[]", "%b{}", '%b""', "%b''", "%b<>" },
          "^.().*().$",
        },
      },
    },
  },
  {
    "tpope/vim-abolish",
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
    dependencies = {
      { "kana/vim-textobj-user" },
    },
  },
  {
    "wellle/targets.vim",
    enabled = false,
    lazy = false,
    config = function()
      vim.cmd([[
" custom targets.vim
" a trigger: add {} to trigger
autocmd User targets#mappings#user call targets#mappings#extend({
    \ 'a': {'argument': [{'o': '[({[]', 'c': '[]})]', 's': ','}]},
    \ 's': { 'separator': [{'d':','}, {'d':'.'}, {'d':';'}, {'d':':'}, {'d':'+'}, {'d':'-'},
    \                      {'d':'='}, {'d':'~'}, {'d':'_'}, {'d':'*'}, {'d':'#'}, {'d':'/'},
    \                      {'d':'\'}, {'d':'|'}, {'d':'&'}, {'d':'$'}] },
    \ 'b': {
    \     'pair':      [{'o':'(', 'c':')'}, {'o':'[', 'c':']'}, {'o':'{', 'c':'}'}, {'o':'<', 'c':'>'}],
    \     'quote':     [{'d':"'"}, {'d':'"'}, {'d':'`'}],
    \     'tag':       [{}],
    \     },
    \ })
      ]])
    end,
  },
  {
    "machakann/vim-sandwich",
    enabled = false,
    config = function()
      vim.g.textobj_sandwich_no_default_key_mappings = 1
    end,
  },
  {
    "echasnovski/mini.surround",
    opts = {
      mappings = {
        add = "sa", -- Add surrounding in Normal and Visual modes
        replace = "sr", -- Replace surrounding
        delete = "sd", -- Delete surrounding
        find = "sf", -- Find surrounding (to the right)
        find_left = "sF", -- Find surrounding (to the left)
        highlight = "sh", -- Highlight surrounding
        update_n_lines = "gsn", -- Update `n_lines`
      },
    },
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
