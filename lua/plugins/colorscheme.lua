return {
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "night",
      on_highlights = function(hl, c)
        local prompt = "#2d3149"
      end,
    },
  },
}
