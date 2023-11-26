return {
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
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[ 
██╗   ██╗ █████╗ ███╗   ██╗ ██████╗██╗   ██╗
╚██╗ ██╔╝██╔══██╗████╗  ██║██╔════╝╚██╗ ██╔╝
 ╚████╔╝ ███████║██╔██╗ ██║██║      ╚████╔╝ 
  ╚██╔╝  ██╔══██║██║╚██╗██║██║       ╚██╔╝  
   ██║   ██║  ██║██║ ╚████║╚██████╗   ██║   
   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝   ╚═╝   
      ]]
      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },
}
