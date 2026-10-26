return {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "JoosepAlviste/nvim-ts-context-commentstring", opts = { enable_autocmd = false } },
	},
	config = function()
		-- import comment plugin safely
		local comment = require("Comment")

		local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

		-- enable comment
		comment.setup({
			padding = false,
			sticky = false,
			mappings = {
				basic = true,
				extra = false,
			},
			toggler = {
				line = "gcc", -- Custom key for toggling line comments
				block = "gbc", -- Custom key for toggling block comments
			},
			extra = {
				above = "gcO", -- Comment above
				below = "gco", -- Comment below
				eol = "gcA", -- Comment at end of line
			},

			-- gc for line comments and gb for block comments
			opleader = {
				line = "gc",
				block = "gb",
			},
			-- or a function for specific behaviour nil as a basic option
			post_hook = function() end,

			-- for commenting tsx, jsx, svelte, html files
			pre_hook = ts_context_commentstring.create_pre_hook(),
		})
	end,
}
