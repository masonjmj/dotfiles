local ok, tree = pcall(require, "nvim-tree")
if not ok then
	vim.notify("Nvimtree couldn't be installed!", "error")
	return
end

tree.setup()
