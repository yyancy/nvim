return {
  -- Tokyo Night colorscheme - dark, modern theme
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "storm",
      on_highlights = function(hl, c)
        -- Additional highlight customizations can go here
        -- Example: local prompt = "#2d3149"
      end,
    },
  },

  -- Noice - improved UI for messages, cmdline, popupmenu
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      -- Enable LSP documentation border for better visual separation
      opts.presets.lsp_doc_border = true
    end,
  },

  -- nvim-notify - notification system with high visibility
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 5000, -- notification timeout in milliseconds
    },
  },

  -- Snacks - collection of useful utilities (dashboard, picker, etc.)
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        -- Dashboard can be disabled by setting enabled = true
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
      -- Disable snacks.nvim's built-in notifier in favor of nvim-notify
      notifier = {
        enabled = false,
        timeout = 3000,
      },
    },
  },
}
