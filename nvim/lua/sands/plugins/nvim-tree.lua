return {
	"nvim-tree/nvim-tree.lua",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		require("nvim-web-devicons").set_default_icon("", "#d8dee9", 253)

		require("nvim-tree").setup({
			view = {
				width = 35,
				number = false,
				relativenumber = false,
				signcolumn = "no",
			},
			renderer = {
				root_folder_label = false,
				highlight_git = false,
				indent_markers = {
					enable = true,
				},
				icons = {
					glyphs = {
						default = "",
						symlink = "",
						folder = {
							default = "",
							open = "",
							empty = "",
							empty_open = "",
							symlink = "",
							symlink_open = "",
						},
					},
					show = {
						git = false,
						folder_arrow = false,
						modified = false,
						diagnostics = false,
						bookmarks = false,
					},
				},
			},
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
			filters = {
				custom = { ".DS_Store" },
			},
			git = {
				ignore = false,
			},
		})

		local map = vim.keymap.set
		map("n", "<C-d>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
		map("n", "<leader>r", "<cmd>NvimTreeFindFile<CR>", { desc = "Find current file in explorer" })
		map("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
		map("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" })
		map("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
		map("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })
	end,
}
