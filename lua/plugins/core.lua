return {
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "gruvbox",
    },
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      -- style = "storm",
      on_highlights = function(hl, c)
        local prompt = "#2d3149"
      end,
    },
  },
  { "vim-illuminate", opts = {
    under_cursor = false,
  } },
}
