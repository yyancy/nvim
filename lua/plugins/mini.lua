return {
  {
    "echasnovski/mini.operators",
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
}
