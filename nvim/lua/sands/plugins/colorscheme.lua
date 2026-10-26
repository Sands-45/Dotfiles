return {
	"shaunsingh/nord.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.g.nord_contrast = true
		vim.g.nord_borders = false
		vim.g.nord_disable_background = false
		vim.g.nord_italic = false
		vim.g.nord_uniform_diff_background = true
		vim.g.nord_bold = false
		require("nord").set()
		local bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg
		vim.api.nvim_set_hl(0, "WinSeparator", { fg = bg, bg = bg })
		vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { fg = bg, bg = bg })
		vim.api.nvim_set_hl(0, "WinBar", { fg = "#d8dee9", bg = bg })
		vim.api.nvim_set_hl(0, "WinBarNC", { fg = "#616e88", bg = bg })
		vim.api.nvim_set_hl(0, "StatusLine", { fg = "#d8dee9", bg = bg })
		vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "#616e88", bg = bg })
	end,
}
