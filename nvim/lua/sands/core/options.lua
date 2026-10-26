vim.cmd("let g:netrw_liststyle = 3")

vim.o.laststatus = 3
vim.opt.cmdheight = 0

vim.api.nvim_create_autocmd("CmdlineEnter", {
	group = vim.api.nvim_create_augroup("cmdheight_1_on_cmdlineenter", { clear = true }),
	command = ":set cmdheight=1",
})

vim.api.nvim_create_autocmd("CmdlineLeave", {
	group = vim.api.nvim_create_augroup("cmdheight_0_on_cmdlineleave", { clear = true }),
	command = ":set cmdheight=0",
})

vim.api.nvim_create_autocmd("BufWritePost", {
	group = vim.api.nvim_create_augroup("hide_message_after_write", { clear = true }),
	pattern = { "*" },
	command = "redrawstatus",
})

vim.api.nvim_create_autocmd("FocusLost", {
	group = vim.api.nvim_create_augroup("save_on_focus_lost", { clear = true }),
	command = "silent! wa",
})

vim.filetype.add({
	filename = {
		Jenkinsfile = "groovy",
		Fastfile = "ruby",
	},
})

local opt = vim.opt

opt.number = true
opt.relativenumber = false
opt.numberwidth = 4

opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

opt.wrap = true

opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true
opt.showmatch = true
opt.matchtime = 2

opt.list = true
opt.listchars = { tab = "▸ " }

opt.cursorline = true
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.fillchars = { eob = " ", vert = " ", vertleft = " ", vertright = " ", verthoriz = " " }

opt.autoread = true
opt.mouse = "nvi"
opt.hidden = true
opt.lazyredraw = false

opt.backspace = "indent,eol,start"
opt.whichwrap:append("<,>,h,l")

opt.clipboard:append("unnamedplus")

opt.splitright = true
opt.splitbelow = true

opt.wildmode = "longest:full,full"
opt.wildignorecase = true
opt.wildignore = { "*.o", "*~", "*.pyc", "*/.git/*", "*/.hg/*", "*/.svn/*", "*/.DS_Store" }

opt.errorbells = false
opt.visualbell = false
opt.timeoutlen = 500

opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.undofile = true
opt.undodir = vim.fn.stdpath("state") .. "/undo"
