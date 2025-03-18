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
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      opts.presets.lsp_doc_border = true
    end,
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 5000,
    },
  },
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        -- enabled = true,
        preset = {
          header = [[ 
██╗   ██╗ █████╗ ███╗   ██╗ ██████╗██╗   ██╗
╚██╗ ██╔╝██╔══██╗████╗  ██║██╔════╝╚██╗ ██╔╝
 ╚████╔╝ ███████║██╔██╗ ██║██║      ╚████╔╝ 
  ╚██╔╝  ██╔══██║██║╚██╗██║██║       ╚██╔╝  
   ██║   ██║  ██║██║ ╚████║╚██████╗   ██║   
   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝   ╚═╝   
      ]],
        },
      },
      notifier = {
        enabled = false,
        timeout = 3000,
      },
    },
  },
}
