return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		local map = vim.keymap.set

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local function opts(desc)
					return { buffer = ev.buf, silent = true, desc = desc }
				end
				map("n", "gR", "<cmd>Telescope lsp_references<CR>", opts("Show LSP references"))
				map("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
				map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts("Show LSP definitions"))
				map("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts("Show LSP implementations"))
				map("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts("Show LSP type definitions"))
				map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("See available code actions"))
				map("n", "<leader>rn", vim.lsp.buf.rename, opts("Smart rename"))
				map("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts("Show buffer diagnostics"))
				map("n", "<leader>d", vim.diagnostic.open_float, opts("Show line diagnostics"))
				map("n", "[d", function()
					vim.diagnostic.jump({ count = -1, float = true })
				end, opts("Go to previous diagnostic"))
				map("n", "]d", function()
					vim.diagnostic.jump({ count = 1, float = true })
				end, opts("Go to next diagnostic"))
				map("n", "K", vim.lsp.buf.hover, opts("Show documentation for what is under cursor"))
				map("n", "<leader>rs", "<cmd>LspRestart<CR>", opts("Restart LSP"))
			end,
		})

		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.HINT] = "󰠠 ",
					[vim.diagnostic.severity.INFO] = " ",
				},
			},
		})

		vim.lsp.config("*", {
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
		})

		vim.lsp.config("svelte", {
			on_attach = function(client)
				vim.api.nvim_create_autocmd("BufWritePost", {
					pattern = { "*.js", "*.ts" },
					callback = function(ctx)
						client:notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
					end,
				})
			end,
		})

		vim.lsp.config("graphql", {
			filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
		})

		vim.lsp.config("emmet_ls", {
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
		})

		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					diagnostics = { globals = { "vim" } },
					completion = { callSnippet = "Replace" },
				},
			},
		})
	end,
}
