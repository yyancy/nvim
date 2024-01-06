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
        L = function(ai_type)
          local line_num = vim.fn.line(".")
          local line = vim.fn.getline(line_num)
          -- Select `\n` past the line for `a` to delete it whole
          local from_col, to_col = 1, line:len() + 1
          if ai_type == "i" then
            if line:len() == 0 then
              -- Don't remove empty line
              from_col, to_col = 0, 0
            else
              -- Ignore indentation for `i` textobject and don't remove `\n` past the line
              from_col = line:match("^%s*()")
              to_col = line:len()
            end
          end

          return { from = { line = line_num, col = from_col }, to = { line = line_num, col = to_col } }
        end,
        e = function(ai_type)
          local n_lines = vim.fn.line("$")
          local start_line, end_line = 1, n_lines
          if ai_type == "i" then
            -- Skip first and last blank lines for `i` textobject
            local first_nonblank, last_nonblank = vim.fn.nextnonblank(1), vim.fn.prevnonblank(n_lines)
            start_line = first_nonblank == 0 and 1 or first_nonblank
            end_line = last_nonblank == 0 and n_lines or last_nonblank
          end

          local to_col = math.max(vim.fn.getline(end_line):len(), 1)
          return { from = { line = start_line, col = 1 }, to = { line = end_line, col = to_col } }
        end,
      },
    },
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
