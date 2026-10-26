return {
	"rmagatti/auto-session",
	config = function()
		require("auto-session").setup({
			auto_restore = false,
			suppressed_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
		})

		local map = vim.keymap.set
		map("n", "<leader>Sr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" })
		map("n", "<leader>Ss", "<cmd>SessionSave<CR>", { desc = "Save session for cwd" })
	end,
}
