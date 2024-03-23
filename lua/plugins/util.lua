return {
  {
    "tommcdo/vim-lion",
    vscode = true,
    lazy = false,
  },
  { "tpope/vim-repeat", lazy = false },
  { "ku1ik/vim-pasta", lazy = false },
  {
    "gbprod/cutlass.nvim",
    opts = {
      cut_key = "x",
      -- exclude = { "nd" },
    },
  },
  {
    "LunarVim/bigfile.nvim",
    opts = {
      features = {
        "indent_blankline",
        "illuminate",
        "treesitter",
        "lsp",
        "syntax",
      },
      pattern = function(bufnr, filesize_mib)
        -- you can't use `nvim_buf_line_count` because this runs on BufReadPre
        local file_contents = vim.fn.readfile(vim.api.nvim_buf_get_name(bufnr))
        local file_length = #file_contents
        local filetype = vim.filetype.match({ buf = bufnr })
        if file_length > 8000 then
          return true
        end
      end,
    },
  },
}
