local ai = require("mini.ai")
return {
  {
    "nvim-mini/mini.operators",
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
    "nvim-mini/mini.splitjoin",
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
    "nvim-mini/mini.pairs",
    enabled = false,
    -- disabled in favor of nvim-autopairs for better compatibility
  },
  {
    "nvim-mini/mini.ai",
    enabled = true,
    opts = {
      custom_textobjects = {
        e = {
          {
            "%u[%l%d]+%f[^%l%d]",
            "%f[%S][%l%d]+%f[^%l%d]",
            "%f[%P][%l%d]+%f[^%l%d]",
            "^[%l%d]+%f[^%l%d]",
            "%f[%S][%w]+%f[^%w]",
            "%f[%P][%w]+%f[^%w]",
            "^%w+%f[^%w]",
          },
          "^().*()$",
        },
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
        i = function(ai_type)
          local spaces = (" "):rep(vim.o.tabstop)
          local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
          local indents = {} ---@type {line: number, indent: number,tabs: number, text: string}[]

          for l, line in ipairs(lines) do
            if not line:find("^%s*$") then
              indents[#indents + 1] =
                { line = l, indent = #line:gsub("\t", spaces):match("^%s*"), tabs = #line:match("^\t*"), text = line }
            end
          end

          local ret = {} ---@type (Mini.ai.region | {indent: number})[]

          for i = 1, #indents do
            if i == 1 or indents[i - 1].indent < indents[i].indent then
              local from, to = i, i
              for j = i + 1, #indents do
                if indents[j].indent < indents[i].indent then
                  break
                end
                to = j
              end
              from = ai_type == "a" and from > 1 and from - 1 or from
              to = ai_type == "a" and to < #indents and to + 1 or to
              local tabs = indents[from].tabs > 0 and indents[from].tabs * vim.o.tabstop or 0
              ret[#ret + 1] = {
                indent = indents[i].indent,
                from = {
                  line = indents[from].line,
                  col = ai_type == "a" and 1 or (indents[from].indent + 1 - tabs),
                },
                to = { line = indents[to].line, col = #indents[to].text },
              }
            end
          end

          return ret
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
    "nvim-mini/mini.surround",
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
}
