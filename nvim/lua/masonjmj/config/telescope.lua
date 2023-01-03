local ok, telescope = pcall(require, 'telescope')
if not ok then
	vim.notify("Telescope couldn't be loaded", "error")
	return
end

telescope.setup{
	pickers = {
		find_files = {
			theme = "dropdown",
			previewer = false,
		}
	},
	extensions = {
		fzf = {},
		notify = {},
	}
}

telescope.load_extension("fzf")
telescope.load_extension("todo-comments")
telescope.load_extension("notify")
