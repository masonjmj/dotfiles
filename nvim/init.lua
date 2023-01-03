vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("masonjmj.plugins")
require("masonjmj.autocmd")
require("masonjmj.colorscheme")
require("masonjmj.config.nvimtree")
require("masonjmj.config.indent")
require("masonjmj.config.telescope")
require("masonjmj.config.lualine")
require("masonjmj.config.treesitter")
require("masonjmj.config.lsp")
require("masonjmj.config.cmp")
require("masonjmj.config.gitsigns")
require("masonjmj.config.comment")
require("masonjmj.config.illuminate")
require("masonjmj.settings")

local ok, _ = pcall(require, "masonjmj.keymap")
if not ok then
	vim.notify("Failed to load keymap")
	return
end
