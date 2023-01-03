local ok, indent = pcall(require, "indent_blankline")
if not ok then
	vim.notify("Indent blankline couldn't be installed", "error")
	return
end

vim.opt.list = true
indent.setup {
	space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = true,
	use_treesitter = true,
	-- use_treesitter_scope = true,
	char = "▎"
}
