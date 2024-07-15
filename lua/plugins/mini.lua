local ai = require("mini.ai")
return {
  {
    "echasnovski/mini.operators",
    event = "VeryLazy",
    vscode = true,
    keys = {
      { "S", "s$", desc = "replace content with register until line end", remap = true },
    },
    opts = {
      exchange = {
        prefix = "cx",
      },
      replace = {
        prefix = "s",
      },
    },
  },
  {
    "echasnovski/mini.splitjoin",
    event = "VeryLazy",
    vscode = true,
    opts = {},
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
  {
    "echasnovski/mini.pairs",
    enabled = false,
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
        B = function(ai_type)
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
  }
}
