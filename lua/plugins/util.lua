return {
  {
    "tommcdo/vim-lion",
    vscode = true,
    lazy = false,
  },
  { "tpope/vim-repeat", lazy = false, vscode = true },
  { "ku1ik/vim-pasta", lazy = false },
  {
    "gbprod/cutlass.nvim",
    vscode = true,
    opts = {
      cut_key = "x",
      -- exclude = { "nd" },
    },
  },
  {
    "ton/vim-bufsurf",
    lazy = false,
    keys = {
      {
        "<leader>o",
        "<Plug>(buf-surf-back)",
        mode = { "n" },
      },
      {
        "<leader>i",
        "<Plug>(buf-surf-forward)",
        mode = { "n" },
      },
    },
  },
}
