local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", opts)
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, opts)
