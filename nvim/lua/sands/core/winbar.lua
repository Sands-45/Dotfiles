local M = {}

function M.render()
	local path = vim.fn.expand("%:~:.")
	if path == "" then
		return ""
	end
	local mod = vim.bo.modified and " ●" or ""
	local right = vim.bo.filetype
	local ok, devicons = pcall(require, "nvim-web-devicons")
	if ok and right ~= "" then
		local icon, hl = devicons.get_icon(vim.fn.expand("%:t"), vim.fn.expand("%:e"), { default = true })
		right = "%#" .. hl .. "#" .. icon .. " %*" .. right
	end
	return " " .. path .. mod .. "%=" .. right .. " "
end

vim.api.nvim_create_autocmd({ "BufWinEnter", "FileType" }, {
	group = vim.api.nvim_create_augroup("sands_winbar", { clear = true }),
	callback = function()
		if vim.bo.buftype == "" then
			vim.wo.winbar = "%{%v:lua.require'sands.core.winbar'.render()%}"
		else
			vim.wo.winbar = ""
		end
	end,
})

return M
