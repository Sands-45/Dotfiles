return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
		})

		telescope.load_extension("fzf")

		local map = vim.keymap.set

		map("n", "<leader>o", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
		map("n", "<leader>a", "<cmd>Telescope live_grep<cr>", { desc = "Grep in cwd" })

		map("n", "<C-p>f", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
		map("n", "<C-p>g", "<cmd>Telescope git_files<cr>", { desc = "Git files" })
		map("n", "<C-p>l", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Lines in buffer" })
		map("n", "<C-p>b", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
		map("n", "<C-p>m", "<cmd>Telescope keymaps<cr>", { desc = "Keymaps" })
		map("n", "<C-p>c", "<cmd>Telescope git_commits<cr>", { desc = "Git commits" })
		map("n", "<C-p>h", "<cmd>Telescope oldfiles<cr>", { desc = "Recent files" })

		map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		map("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		map("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		map("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
	end,
}
