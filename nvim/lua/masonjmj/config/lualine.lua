local ok, lualine = pcall(require, "lualine")
if not ok then
	vim.notify("Lualine couldn't be loaded", "error")
	return
end

lualine.setup {
	options = {
		theme = "kanagawa"
	}
}
