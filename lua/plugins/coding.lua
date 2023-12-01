return {
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
  },
  {
    "echasnovski/mini.ai",
    opts = {
      custom_textobjects = {
        b = { { "%b()", "%b[]", "%b{}", '%b""', "%b''", "%b<>" }, "^.().*().$" },
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
  },
  {
    "svermeulen/vim-subversive",
    keys = {
      { "s", "<plug>(SubversiveSubstitute)", desc = "replace content" },
      { "ss", "<plug>(SubversiveSubstituteLine)", desc = "replace the whole content" },
      { "S", "<plug>(SubversiveSubstituteToEndOfLine)", desc = "replace content until end of line" },
    },
  },
  {
    "gbprod/yanky.nvim",
    vscode = true,
  },
}
