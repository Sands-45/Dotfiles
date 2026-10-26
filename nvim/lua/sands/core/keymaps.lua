vim.g.mapleader = ","

local map = vim.keymap.set

map("i", "jk", "<ESC>", { desc = "Exit insert mode" })

map("n", "<leader>w", "<cmd>w!<CR>", { desc = "Save file" })
map("n", "<leader><space>", "<cmd>noh<CR>", { desc = "Clear search highlights" })
map("n", "<leader>nh", "<cmd>noh<CR>", { desc = "Clear search highlights" })

map("n", "/", "/\\v")
map("v", "/", "/\\v")
map({ "n", "v" }, "<tab>", "%", { desc = "Jump to matching bracket" })

map("n", "j", "gj")
map("n", "k", "gk")

map("n", "<leader>+", "<C-a>", { desc = "Increment number" })
map("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
map("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
map("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

map("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
map("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
map("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
map("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
map("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

map("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>ba", "<cmd>b#<CR>", { desc = "Alternate buffer" })

map({ "n", "v", "c" }, "<C-a>", "<Home>")
map({ "n", "v", "c" }, "<C-e>", "<End>")
map("c", "<C-k>", "<C-u>")
