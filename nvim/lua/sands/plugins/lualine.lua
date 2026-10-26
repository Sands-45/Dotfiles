return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "shaunsingh/nord.nvim" },
	config = function()
		local lazy_status = require("lazy.status")
		local theme = require("lualine.themes.nord")
		for _, mode in pairs(theme) do
			for _, section in ipairs({ "b", "c" }) do
				if mode[section] then
					mode[section].bg = "#2e3440"
				end
			end
		end

		require("lualine").setup({
			options = {
				theme = theme,
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { { "mode", separator = { left = "\u{e0b6}" } } },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#d08770" },
					},
					"encoding",
					"filetype",
				},
				lualine_y = { "progress" },
				lualine_z = { { "location", separator = { right = "\u{e0b4}" } } },
			},
		})
	end,
}
