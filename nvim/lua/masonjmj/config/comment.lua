local ok, comment = pcall(require, "Comment")
if not ok then
	vim.notify("Comment couldn't be installed!", "error")
	return
end

comment.setup()
