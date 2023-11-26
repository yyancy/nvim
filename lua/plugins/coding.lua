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
}
