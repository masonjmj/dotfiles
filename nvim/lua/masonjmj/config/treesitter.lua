local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then
	vim.notify("Treesitter couldn't be installed", "error")
	return
end

treesitter.setup{
  ensure_installed = { "c", "rust", "lua", },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

},
  indent = {
    enable = true
  },
}
