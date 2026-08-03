return {
  {
    "tommcdo/vim-lion",
    vscode = true,
    keys = {
      { "gl", "<Plug>(lion-left)", mode = { "n", "v" }, desc = "Align left" },
      { "gL", "<Plug>(lion-right)", mode = { "n", "v" }, desc = "Align right" },
    },
  },
  {
    "tpope/vim-repeat",
    vscode = true,
    keys = { { ".", ".<cr>", mode = "n" } },
  },
  -- {
  --   "ku1ik/vim-pasta",
  --   keys = {
  --     { "p", "<Plug>(pasta)", mode = "n" },
  --     { "P", "<Plug>(PastaAbove)", mode = "n" },
  --   },
  -- },
  {
    "gbprod/cutlass.nvim",
    vscode = true,
    opts = {
      cut_key = "x",
    },
  },
  {
    "ton/vim-bufsurf",
    keys = {
      {
        "<leader>o",
        "<Plug>(buf-surf-back)",
        mode = "n",
        desc = "Buffer history back",
      },
      {
        "<leader>i",
        "<Plug>(buf-surf-forward)",
        mode = "n",
        desc = "Buffer history forward",
      },
    },
  },
}
