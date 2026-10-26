return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "shaunsingh/nord.nvim" },
	version = "*",
	config = function()
		require("bufferline").setup({
			options = {
				mode = "tabs",
				separator_style = "thin",
				always_show_bufferline = false,
				show_buffer_close_icons = false,
				show_close_icon = false,
				offsets = {
					{ filetype = "NvimTree", text = "", separator = false },
				},
			},
			highlights = require("nord").bufferline.highlights({
				italic = false,
				bold = false,
			}),
		})
	end,
}
