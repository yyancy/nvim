local completion = {}
local conf = require("yancy.modules.completion.config")

-- completion['neovim/nvim-lspconfig'] = {
--   -- opt = true,
--   event = "BufReadPre",
-- 	config = conf.nvim_lsp,
-- }
-- completion["glepnir/lspsaga.nvim"] = {
-- 	-- opt = true,
--   branch = "main",
-- 	after = "nvim-lspconfig",
-- 	config = conf.lspsaga,
-- }
return completion
