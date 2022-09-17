local config = {}

function config.bufferline()
  require("bufferline").setup{
  options = {
    numbers = "ordinal"
    }
  }
  keymap = vim.keymap.set
  bufferline = require("bufferline")
  keymap('n', '<leader>1', function() bufferline.go_to_buffer(1,true)end )
  keymap('n', '<leader>2', function() bufferline.go_to_buffer(2,true)end )
  keymap('n', '<leader>3', function() bufferline.go_to_buffer(3,true)end )
  keymap('n', '<leader>4', function() bufferline.go_to_buffer(4,true)end )
  keymap('n', '<leader>5', function() bufferline.go_to_buffer(5,true)end )
  keymap('n', '<leader>6', function() bufferline.go_to_buffer(6,true)end )
  keymap('n', '<leader>7', function() bufferline.go_to_buffer(7,true)end )
  keymap('n', '<leader>8', function() bufferline.go_to_buffer(8,true)end )
  keymap('n', '<leader>9', function() bufferline.go_to_buffer(9,true)end )
  keymap('n', '<leader>gb','<cmd>BufferLinePick<CR>')
  keymap('n', '[b','<cmd>BufferLineCyclePrev<CR>')
  keymap('n', ']b','<cmd>BufferLineCycleNext<CR>')
end

function config.nvim_navic()
	vim.g.navic_silence = true

	require("nvim-navic").setup({
		icons = {
			Method = " ",
			Function = " ",
			Constructor = " ",
			Field = " ",
			Variable = " ",
			Class = "ﴯ ",
			Interface = " ",
			Module = " ",
			Property = "ﰠ ",
			Enum = " ",
			File = " ",
			EnumMember = " ",
			Constant = " ",
			Struct = " ",
			Event = " ",
			Operator = " ",
			TypeParameter = " ",
			Namespace = " ",
			Object = " ",
			Array = " ",
			Boolean = " ",
			Number = " ",
			Null = "ﳠ ",
			Key = " ",
			String = " ",
			Package = " ",
		},
		highlight = true,
		separator = " > ",
		depth_limit = 0,
		depth_limit_indicator = "..",
	})
end

return config
